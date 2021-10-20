
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end

When /I go to the edit page for "(.*)"/ do |movie|
  title = Movie.find_by(title: movie).id
  #steps %{I go to }
  visit edit_movie_path(title)
  #steps %{I follow "More about #{movie}"}
  #steps %{I press "Edit"}
end

Then /the director of "(.*)" should be "(.*)"/ do |movie,dir|
  title = Movie.find_by(title: movie)
  #title.director.include?(dir)
  #step %{The director field within #{movie} should contain #{dir}}
  #assert_equal title.director,dir
  title.director.should include(dir)
end