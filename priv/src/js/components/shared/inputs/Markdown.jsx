import showdown from "showdown";
import validatesInput from "../mixins/validatesInput";

const converter = new showdown.Converter();
converter.setOption("noHeaderId", true);

export default {
  mixins: [validatesInput],
  data() {
    return { htmlOutput: "" };
  },
  watch: {
    initialValue(next, prev) {
      if (next !== prev) {
        this.updateHtmlOutput();
      }
    }
  },
  mounted() {
    this.htmlOutput = converter.makeHtml(this.initialValue);
  },
  methods: {
    editContent() {
      this.isPreviewing = false;
      this.$nextTick(() => {
        this.$refs.editPane.focus();
      });
    },
    previewContent() {
      this.$refs.editPane.blur();
      this.isPreviewing = true;
      this.updateHtmlOutput();
    },
    updateHtmlOutput() {
      this.htmlOutput = this.value
        ? converter.makeHtml(this.value)
        : converter.makeHtml(this.initialValue);
    }
  },
  render() {
    return (
      <div class="form-group markdown-input">
        <label for="markdown">{this.label}</label>
        <ul class="tabs-list">
          <li
            class={{ active: this.isPreviewing }}
            onClick={this.previewContent}
          >
            Preview
          </li>
          <li class={{ active: !this.isPreviewing }} onClick={this.editContent}>
            Edit
          </li>
        </ul>
        {!this.isPreviewing && (
          <textarea
            class={{
              "form-control": true,
              "is-invalid": this.applyInvalidCssClass
            }}
            id="markdown"
            name={this.name}
            onClick={this.editContent}
            onInput={this.handleInput}
            ref="editPane"
            rows="20"
            value={this.currentValue}
          />
        )}
        {this.isPreviewing && (
          <div
            class={{ "is-invalid": this.applyInvalidCssClass }}
            class="markdown-preview"
            domPropsInnerHTML={this.htmlOutput}
          />
        )}
        <div class="invalid-feedback">{this.errorFeedback}</div>
      </div>
    );
  }
};
