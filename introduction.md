# Padrino - from the ground up

There are a lot of Padrino tutorials out there that focus on a very important topic: how do I build my first app? Because of this, they also miss another important part of Padrino: how the Framework works internally and how all the pieces are coming together.

On the other hand, architecture descriptions are boring and hard to apply, so I'd like to try something different: describe it in code, by building the smallest possible Padrino app (a single file) and then start to add all the things that add up to the biggest standard app (a full project with multiple app folders). Along the way, I will also try to explain how this relies almost exclusively on mechanics provided by Sinatra and Rack. I hope that this tutorial will also shed some light into those two libraries for those that are not as interested in Padrino as others. Also, all code will be available and tested.

## Some technicalities

Another thing I'd like to try out in this series is to write a complete blog series in QED. Every single file will be runnable and will have a test suite at the end. The test suite is written in AE, as it comes with QED. Those assertions will ensure that all examples are still accurate in a few weeks.

## A short prelude

I started using Padrino in version 0.9. Back then, I was using Sinatra for my diploma thesis and suddently felt the need for a descriptive way of matching `ACCEPT` headers and rendering templates accordingly. This can be implemented on foot using plain Sinatra in a relatively straight way, but I decided to look for a prebuilt library. After a bit of searching, the combination of `Padrino::Routing` and `Padrino::Rendering` (two Sinatra plugins that form the core of Padrino) convinced me - so I used them, without actually using the Padrino framework. Following along this track, I slowly started to use more of the convenience features of Padrino, until I finally started to fully use the small Padrino profile. 1,5 Years after, I almost exclusively use Padrino, but am still tinkering with plugins, additions an remixes of the formula. Basically, I am trying to tell you the story of the time spent with the framework. I also wish to present you how easy it is to trim Padrino down or blow it up, depending on your needs, solely by understanding how the Framework is built.