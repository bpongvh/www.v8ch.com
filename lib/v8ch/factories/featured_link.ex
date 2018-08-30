defmodule V8ch.Factories.FeaturedLink do

  alias FakerElixir, as: Faker
  alias V8ch.ContentTypes.FeaturedLink

  defmacro __using__(_opts) do
    quote do
      def featured_link_factory do
        %FeaturedLink{
          description: Faker.Lorem.sentence,
          href: Faker.Internet.url(:safe),
          title: sequence(:title, &"Featured Link ##{&1 + 1}"),
        }
      end
    end
  end
end
