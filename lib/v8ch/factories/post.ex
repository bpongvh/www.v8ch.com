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

        <div class="post-content__image">
          <img alt="Create AWS Cognito user pool" class="img-fluid" src="https://v8ch.sgp1.digitaloceanspaces.com/wp_aws_cognito_auth_screen_1.jpg" />
        </div>

        #{Faker.Lorem.sentences()}

        #{Faker.Lorem.sentences()}

        ```javascript
        function* logGenerator() {
          console.log(0);
          console.log(1, yield);
          console.log(2, yield);
          console.log(3, yield);
        }

        var gen = logGenerator();

        // the first call of next executes from the // until the first yield statement
        gen.next();             // 0
        gen.next('pretzel');    // 1 pretzel
        gen.next('california'); // 2 california
        gen.next('mayonnaise'); // 3 mayonnaise
        ```

        #{Faker.Lorem.sentences()}

        #{Faker.Lorem.sentences()}

        #{Faker.Lorem.sentences()}
        """

        %Post{
          content: content,
          title: Faker.Lorem.sentence()
        }
      end
    end
  end
end
