defmodule HelloCrawler do
  @default_max_depth 3
  @default_headers []
  @default_options [follow_redirect: true]

  # @spec for get_links/2
  # This is the public function, with the URL as a string and options (keyword list).
  @spec get_links(String.t(), keyword()) :: list(String.t())
  def get_links(url, opts \\ []) do
    url = URI.parse(url)

    context = %{
      max_depth: Keyword.get(opts, :max_depth, @default_max_depth),
      headers: Keyword.get(opts, :headers, @default_headers),
      options: Keyword.get(opts, :options, @default_options),
      host: url.host
    }

    get_links(url, [], context)
    |> Enum.map(&to_string/1)
    |> Enum.uniq()
  end

  # @spec for get_links/3
  # This is the private recursive function, which receives a URI.t() for URL, a list of previously visited URLs (path),
  # and a map containing the crawling context (max_depth, headers, options, and host).
  @spec get_links(URI.t(), list(URI.t()), %{
          max_depth: non_neg_integer(),
          headers: list(),
          options: keyword(),
          host: String.t()
        }) :: list(String.t())
  defp get_links(url, path, context) do
    if continue_crawl?(path, context) and crawlable_url?(url, context) do
      url
      |> to_string
      |> HTTPoison.get(context.headers, context.options)
      |> handle_response(path, url, context)
    else
      [url]
    end
  end

  # @spec for continue_crawl?/2
  # This checks if crawling should continue, based on the path's length and max_depth.
  @spec continue_crawl?(list(URI.t()), %{max_depth: non_neg_integer()}) :: boolean()
  defp continue_crawl?(path, %{max_depth: max_depth}) when length(path) > max_depth, do: false
  defp continue_crawl?(_, _), do: true

  # @spec for crawlable_url?/2
  # This checks if the URL belongs to the same host as the initial one.
  @spec crawlable_url?(URI.t(), %{host: String.t()}) :: boolean()
  defp crawlable_url?(%{host: host}, %{host: initial}) when host == initial, do: true
  defp crawlable_url?(_, _), do: false

  # @spec for handle_response/4 (successful response)
  # Handles the response in case of a successful HTTP request.
  # It receives a tuple with :ok and the body of the response, a list of the visited URLs (path),
  # the current URL as URI.t(), and the context (map with max_depth, headers, etc.).
  @spec handle_response({:ok, %{body: String.t()}}, list(URI.t()), URI.t(), %{
          max_depth: non_neg_integer(),
          headers: list(),
          options: keyword(),
          host: String.t()
        }) :: list(String.t())
  defp handle_response({:ok, %{body: body}}, path, url, context) do
    IO.puts("Crawling \"#{url}\"...")
    path = [url | path]

    [
      url
      | body
        |> Floki.find("a")
        |> Floki.attribute("href")
        |> Enum.map(&URI.merge(url, &1))
        |> Enum.map(&to_string/1)
        |> Enum.reject(&Enum.member?(path, &1))
        |> Enum.map(&get_links(&1, [&1 | path], context))
        |> List.flatten()
    ]
  end

  # @spec for handle_response/3 (failure or error response)
  # This handles the response when an error occurs, or a non-successful status code is returned.
  @spec handle_response({:ok, any()} | {:error, any()}, list(URI.t()), URI.t()) ::
          list(String.t())
  defp handle_response(_response, _path, url) do
    [url]
  end
end
