# Roshan Poudel - Distributing Computations Part 1

| Node 1 | Node 2 |
| :---- | :---- |
| ```:"harry@Roshans-MacBook-Air"``` | ```:"maude@Roshans-MacBook-Air"``` |
| Node.list <br> ```[:"maude@Roshans-MacBook-Air"]``` | Node.list <br> ```[:"harry@Roshans-MacBook-Air"]``` |
| func. () <br> ```:"harry@Roshans-MacBook-Air"``` <br> ```:"harry@Roshans-MacBook-Air"``` | func. () <br> ```:"maude@Roshans-MacBook-Air"``` <br> ```:"maude@Roshans-MacBook-Air"``` |
| Node.spawn :"maude@Roshans-MacBook-Air", func <br> ```#PID<13851.115.0>``` <br> ```:"maude@Roshans-MacBook-Air"``` | Node.spawn :"harry@Roshans-MacBook-Air", func <br> ```#PID<13905.118.0>``` <br> ```:"harry@Roshans-MacBook-Air"``` |
| Yes, it works on both nodes! | Works on this one too! |
| fun. () <br> ```LABS,Homework_1,Daily 2,Daily 5,conway,.DS_Store,Daily 4,Daily 3,Books,.editorconfig,Homework_3,README.md,Homework_4,Homework_2,sandbox,Daily 1,Daily 0,.git,issues :ok``` | fun. () <br> ```Project 4_ CS257-Roshan Poudel.zip,PCA,Discrete Latex HW3,codepath-prework-RoshanPoudel,CS320,Systems Design,temple_run_3js,.DS_Store,My Movie 6.50.36 PM.mp4,VISA Stuffs,Darshan,ptrtut13-1.2,test,Documents - Roshan’s MacBook Air,.localized,reverseknodes.rtf,ENGL101,Academic Transcipt.pdf,Processing,Python CWH,Leetcode,CS276,temple_run,Mathematical Modeling,Presentation1.pptx,susay.jpg,CS284,test.aup3,CS270,CS360,My Movie.mp4,CS257_Projects_zipped,OOP-CS257,DLProjectWork,Class Activities,functional_programming,Professional Photo,Web_Design,OpenSource,Bank Balance Certificate.pdf,hungry_tigers,DV,roshanpoudelresume.docx,My Movie 2.mp4,portfolio-website,Zoom,Shiny_app,CS415,insurance_card.pdf,rpdlresume.pdf,resume_b.pdf,Wolfram Mathematica,JOBS,CS284_FINAL,SineGymno.aup3,test 2.aup3,Final Project.aup3,application_for_degree_credit_for_off-campus_study.pdf,roshanpoudelresume.pdf,KK DSA,Investments :ok``` |
| ```:DTOJYSBKGTCXLIMDDJSH``` | ```:DTOJYSBKGTCXLIMDDJSH``` |
| Node.connect :"maude@Roshans-MacBook-Air" <br> ```false``` | 11:57:16.751 [error] <br> ** Connection attempt from node :"harry@Roshans-MacBook-Air" <br> rejected. Invalid challenge reply. ** |





