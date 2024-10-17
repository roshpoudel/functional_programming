## Roshan Poudel LAB 04 part 02


Q. Find and record the field names (think maps, again) and the type of data in them. You might recognize the contents of the first field as HTML. Also, look at the value associated with the body key and record the text in the title tag.

The field names for %HTTPoison.Response are:

 - status_code -> Integer (eg. 404 if page not found)
 - body -> String (HTML in this case)
 - headers -> List containing Tuples
 - request_url -> String
 - request -> struct with fields like method, url, headers, body, params, options

All other recordings are in the following code block:


```elixir

iex(4)> HTTPoison.get! "http://scarl.sewanee.edu"
%HTTPoison.Response{
  status_code: 301,
  body: "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 2.0//EN\">\n<html><head>\n<title>301 Moved Permanently</title>\n</head><body>\n<h1>Moved Permanently</h1>\n<p>The document has moved <a href=\"https://scarl.sewanee.edu\">here</a>.</p>\n</body></html>\n",
  headers: [
    {"Date", "Thu, 17 Oct 2024 17:11:03 GMT"},
    {"Server", "Apache"},
    {"X-Frame-Options", "SAMEORIGIN"},
    {"Location", "https://scarl.sewanee.edu"},
    {"Content-Length", "233"},
    {"Content-Type", "text/html; charset=iso-8859-1"}
  ],
  request_url: "http://scarl.sewanee.edu",
  request: %HTTPoison.Request{
    method: :get,
    url: "http://scarl.sewanee.edu",
    headers: [],
    body: "",
    params: %{},
    options: []
  }
}


iex(5)> response = HTTPoison.get! "https://scarl.sewanee.edu"
%HTTPoison.Response{
  status_code: 200,
  body: "<!DOCTYPE html PUBLIC \"-//w3c//dtd html 4.0 transitional//en\">\r<html>\r  <head>\r    <meta http-equiv=\"content-type\" content=\"text/html; charset=ISO-8859-1\">\r    <meta name=\"GENERATOR\" content=\"Mozilla/4.61 [en] (WinNT; I) [Netscape]\">\r    <title>Professor Stephen P. Carl</title>\r  </head>\r  <body style=\"          font-family:Baskerville; background: lightgray\">\r    <table style=\"width: 1172px; height: 299px;\" borders=\"0\">\r      <tbody>\r        <tr>\r          <td style=\"width: 511px;\"><img alt=\"My Mug\" src=\"images/youshouldjustbe.png\"\r              style=\"border: 2px solid; width: 246px; height: 190px;\"\r              align=\"left\">\r            <h4>Stephen P. Carl,<br>\r              Associate Professor</h4>\r            <h4><a href=\"https://new.sewanee.edu/programs-of-study/math-cs/\">Computer\n                Science</a> </h4>\r          </td>\r          <td style=\"width: 369.85px;\" colspan=\"2\"> <img alt=\"My Institution\" src=\"images/sewanee.jpg\"\r              style=\"border: 2px solid; width: 281px; height: 187px;\"\r              align=\"left\">\r            <h4><a href=\"http://www.sewanee.edu/\">Sewanee: the University of the\r                South</a> </h4>\r          </td>\r        </tr>\r      </tbody>\r    </table>\r    <hr>\r    <table style=\"width: 907px; height: 779px;\">\r      <tbody>\r        <tr>\r          <td style=\"vertical-align: top; text-align: left; width: 512.65px;\">\r            <h4>Courses Taught - Advent Term, 2024</h4>\r            <ul>\r              <li><small><a href=\"http://scarl.sewanee.edu/CS270/\">CSci 270 -\r                    Computer Systems and Organization<br>\r                  </a></small></li>\r              <li><small><a href=\"http://scarl.sewanee.edu/CS326/\">CSci 326 -\r                    Functional Programming</a> </small></li>\r              <li><small><a href=\"http://scarl.sewanee.edu/other-classes.html\">All\ncourses\n                    taught...</a></small></li>\r            </ul>\r            <h3><small>Research</small></h3>\r            <ul>\r              <li><small><a href=\"http://dokuwiki.sewanee.edu/doku.php?id=computer_science_research\">Join\r                    or Propose a Research Project<br>\r                  </a></small></li>\r              <li><a href=\"http://scarl.sewanee.edu/Research/phobos.html\"><small>Phobos\n                    MMS Simulator<br>\r                  </small></a></li>\r            </ul>\r            <h3><small>Professional Links</small></h3>\r            <ul>\r              <li><small> <a href=\"http://scarl.sewanee.edu/cv.html\">Curriculum\r                    Vitae</a></small></li>\r              <li><small><a href=\"future.html\">Future Challenges in CS</a></small></li>\r              <li> <small><a href=\"http://www.cra.org/\">Computing Research\r                    Association</a></small></li>\r              <li><small> <a href=\"http://www.acm.org/\">Association for\r                    Computing Machinery</a></small></li>\r              <li><small><a href=\"http://ccscse.org/\">CCSC:SE</a> </small></li>\r            </ul>\r            <h3><small>Unprofessional Links</small></h3>\r            <ul>\r              <li><small><a href=\"http://www.nealstephenson.com/reamde.html\">Some\n                    Light Reading</a></small></li>\r              <li><small><a href=\"https://www.sewanee.edu/student-life/sewanee-outing-program/\">Get\n                    Outdoors<br>\r                  </a></small></li>\r              <li><small><a href=\"https://bandcamp.com/spc\">A Little Night Music</a></small></li>\r              <li><small><a href=\"http://mob.rice.edu/\">The MOB</a></small></li>\r            </ul>\r            <h3><small>Personal <em><a href=\"http://scarl.sewanee.edu/statement.html\">Info<br>\r                    <br>\r                  </a></em></small> </h3>\r          </td>\r          <td style=\"vertical-align: top; text-align: left; width: 384.35px;\">\r            <h3><a href=\"https://www.timeanddate.com/worldclock/fullscreen.html?n=171\">Current\n                time</a> in Sewanee, TN</h3>\r            <p><a href=\"https://circleid.com/posts/20221119-in-memoriam-frederick-p-brooks-jr-a-personal-recollection\">In\n       " <> ...,
  headers: [
    {"Date", "Thu, 17 Oct 2024 17:12:29 GMT"},
    {"Server", "Apache"},
    {"X-Frame-Options", "SAMEORIGIN"},
    {"Strict-Transport-Security", "max-age=15552000; includeSubDomains"},
    {"Last-Modified", "Tue, 27 Aug 2024 15:59:46 GMT"},
    {"ETag", "\"1814-620ac54a1331d\""},
    {"Accept-Ranges", "bytes"},
    {"Content-Length", "6164"},
    {"Content-Type", "text/html; charset=UTF-8"}
  ],
  request_url: "https://scarl.sewanee.edu",
  request: %HTTPoison.Request{
    method: :get,
    url: "https://scarl.sewanee.edu",
    headers: [],
    body: "",
    params: %{},
    options: []
  }
}

iex(6)> response.headers
[
  {"Date", "Thu, 17 Oct 2024 17:12:29 GMT"},
  {"Server", "Apache"},
  {"X-Frame-Options", "SAMEORIGIN"},
  {"Strict-Transport-Security", "max-age=15552000; includeSubDomains"},
  {"Last-Modified", "Tue, 27 Aug 2024 15:59:46 GMT"},
  {"ETag", "\"1814-620ac54a1331d\""},
  {"Accept-Ranges", "bytes"},
  {"Content-Length", "6164"},
  {"Content-Type", "text/html; charset=UTF-8"}
]

response = HTTPoison.get! "https://roshanpoudel.vercel.app/"
%HTTPoison.Response{
  status_code: 200,
  body: "<!DOCTYPE html><html lang=\"en\" class=\"!scroll-smooth\"><head><meta charSet=\"utf-8\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/25460892714ab800-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/4de1fea1a954a5b6-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/6d664cce900333ee-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/756f9c755543fe29-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/a34f9d1faa5f3315-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"stylesheet\" href=\"/_next/static/css/4d73a3f31135a1f8.css\" data-precedence=\"next\"/><link rel=\"stylesheet\" href=\"/_next/static/css/34c26eb5be187d8a.css\" data-precedence=\"next\"/><title>Roshan | Personal Portfolio</title><meta name=\"description\" content=\"Roshan is a 4th year undergraduate student studying CS and Maths at University of the South\"/><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/><link rel=\"icon\" href=\"/favicon.ico\" type=\"image/x-icon\" sizes=\"any\"/><meta name=\"next-size-adjust\"/><script src=\"/_next/static/chunks/polyfills-78c92fac7aa8fdd8.js\" noModule=\"\"></script></head><body class=\"__className_cc7fef __className_dde8ef bg-gray-50 text-gray-950 relative pt-28 sm:pt-36 dark:bg-gray-900 dark:text-gray-50 dark:text-opacity-90\"><div class=\"bg-[#fbe2e3] absolute top-[-6rem] -z-10 right-[11rem] h-[31.25rem] w-[31.25rem] rounded-full blur-[10rem] sm:w-[68.75rem] dark:bg-[#946263]\"></div><div class=\"bg-[#dbd7fb] absolute top-[-1rem] -z-10 left-[-35rem] h-[31.25rem] w-[50rem] rounded-full blur-[10rem] sm:w-[68.75rem] md:left-[-33rem] lg:left-[-28rem] xl:left-[-15rem] 2xl:left-[-5rem] dark:bg-[#676394]\"></div><header class=\"z-[999] relative\"><div class=\"fixed top-0 left-1/2 h-[4.5rem] w-full rounded-none border border-white border-opacity-40 bg-white bg-opacity-80 shadow-lg shadow-black/[0.03] backdrop-blur-[0.5rem] sm:top-6 sm:h-[3.25rem] sm:w-[36rem] sm:rounded-full dark:bg-gray-950 dark:border-black/40 dark:bg-opacity-75\" style=\"opacity:0;transform:translateX(-50%) translateY(-100px) translateZ(0)\"></div><nav class=\"flex fixed top-[0.15rem] left-1/2 h-12 -translate-x-1/2 py-2 sm:top-[1.7rem] sm:h-[initial] sm:py-0\"><ul class=\"flex w-[22rem] flex-wrap items-center justify-center gap-y-1 text-[0.9rem] font-medium text-gray-500 sm:w-[initial] sm:flex-nowrap sm:gap-5\"><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300 text-gray-950 dark:text-gray-200\" href=\"#home\">Home<span class=\"bg-gray-100 rounded-full absolute inset-0 -z-10 dark:bg-gray-800\"></span></a></li><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300\" href=\"#about\">About</a></li><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300\" href=\"#experience\">Experience</a></li><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300\" href=\"#skills\">Skills</a></li><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300\" href=\"#projects\">Projects</a></li><li class=\"h-3/4 flex items-cente" <> ...,
  headers: [
    {"Age", "0"},
    {"Cache-Control", "private, no-cache, no-store, max-age=0, must-revalidate"},
    {"Content-Type", "text/html; charset=utf-8"},
    {"Date", "Thu, 17 Oct 2024 17:26:50 GMT"},
    {"Server", "Vercel"},
    {"Strict-Transport-Security",
     "max-age=63072000; includeSubDomains; preload"},
    {"Vary", "RSC, Next-Router-State-Tree, Next-Router-Prefetch"},
    {"X-Matched-Path", "/"},
    {"X-Powered-By", "Next.js"},
    {"X-Vercel-Cache", "MISS"},
    {"X-Vercel-Id", "iad1::iad1::jh6cq-1729186010804-71204e13eaff"},
    {"Transfer-Encoding", "chunked"}
  ],
  request_url: "https://roshanpoudel.vercel.app/",
  request: %HTTPoison.Request{
    method: :get,
    url: "https://roshanpoudel.vercel.app/",
    headers: [],
    body: "",
    params: %{},
    options: []
  }
}

iex(14)> response.request_url
"https://roshanpoudel.vercel.app/"

iex(15)> response.status_code
200

iex(16)> response = HTTPoison.get! "thiswebdoesnotworkk.com"
** (HTTPoison.Error) :nxdomain
    (httpoison 1.8.2) lib/httpoison.ex:258: HTTPoison.request!/5
    iex:13: (file)


iex(17)> response = HTTPoison.get "https://roshanpoudel.vercel.app/"
{:ok,
 %HTTPoison.Response{
   status_code: 200,
   body: "<!DOCTYPE html><html lang=\"en\" class=\"!scroll-smooth\"><head><meta charSet=\"utf-8\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/25460892714ab800-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/4de1fea1a954a5b6-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/6d664cce900333ee-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/756f9c755543fe29-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"preload\" as=\"font\" href=\"/_next/static/media/a34f9d1faa5f3315-s.p.woff2\" crossorigin=\"\" type=\"font/woff2\"/><link rel=\"stylesheet\" href=\"/_next/static/css/4d73a3f31135a1f8.css\" data-precedence=\"next\"/><link rel=\"stylesheet\" href=\"/_next/static/css/34c26eb5be187d8a.css\" data-precedence=\"next\"/><title>Roshan | Personal Portfolio</title><meta name=\"description\" content=\"Roshan is a 4th year undergraduate student studying CS and Maths at University of the South\"/><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/><link rel=\"icon\" href=\"/favicon.ico\" type=\"image/x-icon\" sizes=\"any\"/><meta name=\"next-size-adjust\"/><script src=\"/_next/static/chunks/polyfills-78c92fac7aa8fdd8.js\" noModule=\"\"></script></head><body class=\"__className_cc7fef __className_dde8ef bg-gray-50 text-gray-950 relative pt-28 sm:pt-36 dark:bg-gray-900 dark:text-gray-50 dark:text-opacity-90\"><div class=\"bg-[#fbe2e3] absolute top-[-6rem] -z-10 right-[11rem] h-[31.25rem] w-[31.25rem] rounded-full blur-[10rem] sm:w-[68.75rem] dark:bg-[#946263]\"></div><div class=\"bg-[#dbd7fb] absolute top-[-1rem] -z-10 left-[-35rem] h-[31.25rem] w-[50rem] rounded-full blur-[10rem] sm:w-[68.75rem] md:left-[-33rem] lg:left-[-28rem] xl:left-[-15rem] 2xl:left-[-5rem] dark:bg-[#676394]\"></div><header class=\"z-[999] relative\"><div class=\"fixed top-0 left-1/2 h-[4.5rem] w-full rounded-none border border-white border-opacity-40 bg-white bg-opacity-80 shadow-lg shadow-black/[0.03] backdrop-blur-[0.5rem] sm:top-6 sm:h-[3.25rem] sm:w-[36rem] sm:rounded-full dark:bg-gray-950 dark:border-black/40 dark:bg-opacity-75\" style=\"opacity:0;transform:translateX(-50%) translateY(-100px) translateZ(0)\"></div><nav class=\"flex fixed top-[0.15rem] left-1/2 h-12 -translate-x-1/2 py-2 sm:top-[1.7rem] sm:h-[initial] sm:py-0\"><ul class=\"flex w-[22rem] flex-wrap items-center justify-center gap-y-1 text-[0.9rem] font-medium text-gray-500 sm:w-[initial] sm:flex-nowrap sm:gap-5\"><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300 text-gray-950 dark:text-gray-200\" href=\"#home\">Home<span class=\"bg-gray-100 rounded-full absolute inset-0 -z-10 dark:bg-gray-800\"></span></a></li><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300\" href=\"#about\">About</a></li><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300\" href=\"#experience\">Experience</a></li><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300\" href=\"#skills\">Skills</a></li><li class=\"h-3/4 flex items-center justify-center relative\" style=\"opacity:0;transform:translateY(-100px) translateZ(0)\"><a class=\"flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300\" href=\"#projects\">Projects</a></li><li class=\"h-3/4 flex items-cente" <> ...,
   headers: [
     {"Age", "0"},
     {"Cache-Control",
      "private, no-cache, no-store, max-age=0, must-revalidate"},
     {"Content-Type", "text/html; charset=utf-8"},
     {"Date", "Thu, 17 Oct 2024 17:29:20 GMT"},
     {"Server", "Vercel"},
     {"Strict-Transport-Security",
      "max-age=63072000; includeSubDomains; preload"},
     {"Vary", "RSC, Next-Router-State-Tree, Next-Router-Prefetch"},
     {"X-Matched-Path", "/"},
     {"X-Powered-By", "Next.js"},
     {"X-Vercel-Cache", "MISS"},
     {"X-Vercel-Id", "iad1::iad1::bhkk9-1729186160639-9760a5432d57"},
     {"Transfer-Encoding", "chunked"}
   ],
   request_url: "https://roshanpoudel.vercel.app/",
   request: %HTTPoison.Request{
     method: :get,
     url: "https://roshanpoudel.vercel.app/",
     headers: [],
     body: "",
     params: %{},
     options: []
   }
 }}
iex(19)> response = HTTPoison.get "https://roshanpoudelesfdsf.com"
{:error, %HTTPoison.Error{reason: :nxdomain, id: nil}}
iex(20)> response = HTTPoison.get "https://roshanpoudelesfdsf.com"
{:error, %HTTPoison.Error{reason: :nxdomain, id: nil}}
```

```elixir

iex(20)> HTTPoison.get "http://127.0.0.1"
{:error, %HTTPoison.Error{reason: :econnrefused, id: nil}}
iex(21)> HTTPoison.get "https://127.0.0.1"
{:error, %HTTPoison.Error{reason: :econnrefused, id: nil}}
iex(22)> HTTPoison.get! "http://127.0.0.1"
** (HTTPoison.Error) :econnrefused
    (httpoison 1.8.2) lib/httpoison.ex:258: HTTPoison.request!/5
    iex:22: (file)
iex(22)> HTTPoison.get! "https://127.0.0.1"
** (HTTPoison.Error) :econnrefused
    (httpoison 1.8.2) lib/httpoison.ex:258: HTTPoison.request!/5
    iex:22: (file)
iex(22)> HTTPoison.get "http://api.github.com/repos/elixir-lang/elixir/issues"
{:ok,
 %HTTPoison.Response{
   status_code: 301,
   body: "",
   headers: [
     {"Content-Length", "0"},
     {"Location", "https://api.github.com/repos/elixir-lang/elixir/issues"}
   ],
   request_url: "http://api.github.com/repos/elixir-lang/elixir/issues",
   request: %HTTPoison.Request{
     method: :get,
     url: "http://api.github.com/repos/elixir-lang/elixir/issues",
     headers: [],
     body: "",
     params: %{},
     options: []
   }
 }}
iex(23)> HTTPoison.get "https://api.github.com/repos/elixir-lang/elixir/issues"
{:ok,
 %HTTPoison.Response{
   status_code: 200,
   body: "[{\"url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13912\",\"repository_url\":\"https://api.github.com/repos/elixir-lang/elixir\",\"labels_url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13912/labels{/name}\",\"comments_url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13912/comments\",\"events_url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13912/events\",\"html_url\":\"https://github.com/elixir-lang/elixir/pull/13912\",\"id\":2595263574,\"node_id\":\"PR_kwDOABLXGs5-_uwk\",\"number\":13912,\"title\":\"Add tuple type operators for insertion and deletion\",\"user\":{\"login\":\"gldubc\",\"id\":27832828,\"node_id\":\"MDQ6VXNlcjI3ODMyODI4\",\"avatar_url\":\"https://avatars.githubusercontent.com/u/27832828?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/gldubc\",\"html_url\":\"https://github.com/gldubc\",\"followers_url\":\"https://api.github.com/users/gldubc/followers\",\"following_url\":\"https://api.github.com/users/gldubc/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/gldubc/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/gldubc/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/gldubc/subscriptions\",\"organizations_url\":\"https://api.github.com/users/gldubc/orgs\",\"repos_url\":\"https://api.github.com/users/gldubc/repos\",\"events_url\":\"https://api.github.com/users/gldubc/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/gldubc/received_events\",\"type\":\"User\",\"site_admin\":false},\"labels\":[],\"state\":\"open\",\"locked\":false,\"assignee\":null,\"assignees\":[],\"milestone\":null,\"comments\":0,\"created_at\":\"2024-10-17T16:55:55Z\",\"updated_at\":\"2024-10-17T16:55:55Z\",\"closed_at\":null,\"author_association\":\"MEMBER\",\"active_lock_reason\":null,\"draft\":false,\"pull_request\":{\"url\":\"https://api.github.com/repos/elixir-lang/elixir/pulls/13912\",\"html_url\":\"https://github.com/elixir-lang/elixir/pull/13912\",\"diff_url\":\"https://github.com/elixir-lang/elixir/pull/13912.diff\",\"patch_url\":\"https://github.com/elixir-lang/elixir/pull/13912.patch\",\"merged_at\":null},\"body\":\"Add type safe operators to perform tuple insertion and deletion at a given integer index.\\r\\n\\r\\nDeals with dynamic by considering which values make the operation succeed (e.g., inserting at position 2 into a tuple requires tuples of size at least 2)\",\"closed_by\":null,\"reactions\":{\"url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13912/reactions\",\"total_count\":0,\"+1\":0,\"-1\":0,\"laugh\":0,\"hooray\":0,\"confused\":0,\"heart\":0,\"rocket\":0,\"eyes\":0},\"timeline_url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13912/timeline\",\"performed_via_github_app\":null,\"state_reason\":null},{\"url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13910\",\"repository_url\":\"https://api.github.com/repos/elixir-lang/elixir\",\"labels_url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13910/labels{/name}\",\"comments_url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13910/comments\",\"events_url\":\"https://api.github.com/repos/elixir-lang/elixir/issues/13910/events\",\"html_url\":\"https://github.com/elixir-lang/elixir/issues/13910\",\"id\":2593094113,\"node_id\":\"I_kwDOABLXGs6aj3nh\",\"number\":13910,\"title\":\"Missing debug on calling external commands\",\"user\":{\"login\":\"Eiji7\",\"id\":10956022,\"node_id\":\"MDQ6VXNlcjEwOTU2MDIy\",\"avatar_url\":\"https://avatars.githubusercontent.com/u/10956022?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/Eiji7\",\"html_url\":\"https://github.com/Eiji7\",\"followers_url\":\"https://api.github.com/users/Eiji7/followers\",\"following_url\":\"https://api.github.com/users/Eiji7/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/Eiji7/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/Eiji7/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/Eiji7/subscriptions\",\"organizations_url\":\"https://api.github.com/users/Eiji7/orgs\",\"repos_url\":\"https://api.github.com/users/Eiji7/repos\",\"events_url\":\"https://api.github.com/users/Eiji7/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/Eiji7/received_events\",\"type\":\"User\",\"site_admin\":false}" <> ...,
   headers: [
     {"Date", "Thu, 17 Oct 2024 17:45:43 GMT"},
     {"Content-Type", "application/json; charset=utf-8"},
     {"Cache-Control", "public, max-age=60, s-maxage=60"},
     {"Vary", "Accept,Accept-Encoding, Accept, X-Requested-With"},
     {"ETag",
      "W/\"ad89ea5c1e2779febfc04026bf406b8ffaed167a8194dec9ebf83bdfb949f185\""},
     {"X-GitHub-Media-Type", "github.v3; format=json"},
     {"x-github-api-version-selected", "2022-11-28"},
     {"Access-Control-Expose-Headers",
      "ETag, Link, Location, Retry-After, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Used, X-RateLimit-Resource, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval, X-GitHub-Media-Type, X-GitHub-SSO, X-GitHub-Request-Id, Deprecation, Sunset"},
     {"Access-Control-Allow-Origin", "*"},
     {"Strict-Transport-Security",
      "max-age=31536000; includeSubdomains; preload"},
     {"X-Frame-Options", "deny"},
     {"X-Content-Type-Options", "nosniff"},
     {"X-XSS-Protection", "0"},
     {"Referrer-Policy",
      "origin-when-cross-origin, strict-origin-when-cross-origin"},
     {"Content-Security-Policy", "default-src 'none'"},
     {"Server", "github.com"},
     {"X-RateLimit-Limit", "60"},
     {"X-RateLimit-Remaining", "59"},
     {"X-RateLimit-Reset", "1729190743"},
     {"X-RateLimit-Resource", "core"},
     {"X-RateLimit-Used", "1"},
     {"Accept-Ranges", "bytes"},
     {"Transfer-Encoding", "chunked"},
     {"X-GitHub-Request-Id", "28A0:196D71:5F228:B59C9:67114D47"}
   ],
   request_url: "https://api.github.com/repos/elixir-lang/elixir/issues",
   request: %HTTPoison.Request{
     method: :get,
     url: "https://api.github.com/repos/elixir-lang/elixir/issues",
     headers: [],
     body: "",
     params: %{},
     options: []
   }
 }}

```