# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     V8ch.Repo.insert!(%V8ch.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import V8ch.Factories.Factory

insert(:featured_link, %{
  title: "Code Repositories",
  href: "https://github.com/V8CH",
  description: "V8CH at GitHub"
})

insert(:featured_link, %{
  title: "Combine",
  href: "https://combine.team",
  description: "Team organization architecture built with Laravel, React and VueJS (demo on request)"
})

insert(:featured_link, %{
  title: "Departmentware",
  href: "https://www.departmentware.com",
  description: "SAAS platform for managing documentation of field training for new police officers"
})

insert(:featured_link, %{
  title: "Trivia Challenge",
  href: "/trivia-challenge",
  description: "A non-trivial React web application presenting a trivia quiz"
})

insert(:featured_link, %{
  title: "jeromegoldschmidt.com",
  href: "http://www.jeromegoldschmidt.com",
  description: "Custom WordPress theme"
})

insert(:featured_link, %{
  title: "bakerbrospr.com",
  href: "https://www.bakerbrospr.com",
  description: "Custom WordPress theme"
})

insert_list(3, :post)
