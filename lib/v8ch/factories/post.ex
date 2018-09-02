defmodule V8ch.Factories.Post do

  alias FakerElixir, as: Faker
  alias V8ch.ContentTypes.Post

  defmacro __using__(_opts) do
    quote do
      def post_factory do
        content = """
        #{Faker.Lorem.sentences()}

        #{Faker.Lorem.sentences()}

        #{Faker.Lorem.sentences()}
        """
        %Post{
          content: content,
          title: Faker.Lorem.sentence(),
        }
      end
    end
  end
end
