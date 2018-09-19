import formDataPropertiesTransformer from "../../transformers/form-data/properties";
import markdownValidationFn from "../../validators/markdown";
import textValidationFn from "../../validators/text";
import MarkdownInput from "../shared/inputs/Markdown";
import TextInput from "../shared/inputs/Text";

export default {
  props: {
    save: { required: true, type: Function }
  },
  data() {
    return {
      isTouched: false,
      properties: {
        content: {
          isValid: false,
          name: "content",
          validationFn: markdownValidationFn("Content", true),
          value: ""
        },
        title: {
          isValid: false,
          name: "title",
          validationFn: textValidationFn("Title", true),
          value: ""
        }
      }
    };
  },
  computed: {
    isFormValid() {
      return (
        this.isTouched &&
        !Object.keys(this.properties).find(key => {
          return !this.properties[key].isValid;
        })
      );
    }
  },
  methods: {
    handleChange(valueObject) {
      if (!this.isTouched) {
        this.isTouched = true;
      }
      this.properties[valueObject.name] = Object.assign(
        this.properties[valueObject.name],
        valueObject
      );
    },
    handleSubmit(event) {
      event.preventDefault();
      const formData = formDataPropertiesTransformer(this.properties);
      this.save(formData);
    }
  },
  render() {
    return (
      <form class="overlay" novalidate onSubmit={this.handleSubmit}>
        <TextInput
          initial-value=""
          label="Title"
          name="title"
          onChange={this.handleChange}
          required={true}
          validation-fn={this.properties.title.validationFn}
          value={this.properties.title.value}
        />
        <MarkdownInput
          initial-value=""
          label="Content"
          name="content"
          onChange={this.handleChange}
          required={true}
          validation-fn={this.properties.content.validationFn}
          value={this.properties.content.value}
        />
        <button
          disabled={!this.isFormValid}
          class="btn btn-block btn-primary"
          type="submit"
        >
          Submit
        </button>
      </form>
    );
  }
};