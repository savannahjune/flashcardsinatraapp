A Simple Flashcard Web App!
===========================

A simple way to keep track of words and definitions that I'm trying to memorize. 

How to Install to Run the App Locally
------------

1) First, clone this directory to your computer by typing this into the command line where you would like to save the repository.

<pre><code>$ git clone https://github.com/loupe/flashcard-homework-savannah.git</code></pre>

2) Install the bundler gem if you don't have it yet.

<pre><code>gem install bundler</code></pre>

3) Install required gems after cd'ing into the flashcard-homework-savannah folder.

<pre><code>bundle install</code></pre>

4) Start the app

<pre><code>ruby main.rb</code></pre>

5) Open the app in your browser: http://localhost:4567/

You will be using the database that I created while working on the project. If you'd like to dump it and start anew, delete flashcards.db from the folder, make a new blank flashcards.db file and then type the following into your terminal:

<pre><code> irb </code></pre>
<pre><code> require './main' </code></pre>
<pre><code> Flashcard.auto_migrate! </code></pre>

Then you can create a flashcard in the terminal with this format:

<pre><code> >Flashcard.create(word:"put word or phrase here", definition:"put the definition of your word or phrase here", difficulty:1) </pre></code>

For difficulty put a 1 for easy, 2 for medium, and 3 for hard. Alternatively, once you create the database you can add cards through the user interface at http://localhost:4567/


How to Use the App
----------

On main page you can make a new flashcard or study your cards.  Click on the easy, medium, or hard toggles to limit the cards you study by difficulty.  Otherwise, you will be able to flip through all your cards.  Click "flip" to see the answer/defintion and then "next" to see another card.  You can also view all of your cards by clicking "See All Cards". You can also see all of your cards by visiting "/flashcards".  From the flashcard page, you can edit any of your existing flashcards.   

Tech stack
----------

- Sinatra
- Jquery
- Database - SQLite
- GitHub
- Slim Templates



