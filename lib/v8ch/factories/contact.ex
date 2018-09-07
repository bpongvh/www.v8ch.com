defmodule V8ch.Factories.Contact do

  alias FakerElixir, as: Faker
  alias V8ch.Contacts.Contact

  defmacro __using__(_opts) do
    quote do
      def contact_factory do
        %Contact{
          email: FakerElixir.Internet.email(),
          message: Faker.Lorem.sentences(3),
        }
      end
    end
  end
end
