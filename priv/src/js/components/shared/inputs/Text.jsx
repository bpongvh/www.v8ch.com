import validatesInput from "../mixins/validatesInput";

export default {
  mixins: [validatesInput],
  data() {
    return { text: this.initialValue };
  },
  render() {
    return (
      <div class="form-group markdown-input">
        <label for="markdown">{this.label}</label>
        <input
          class={{
            "form-control": true,
            "is-invalid": this.applyInvalidCssClass
          }}
          id="text"
          name={this.name}
          onInput={this.handleInput}
          value={this.currentValue}
        />
        <div class="invalid-feedback">{this.errorFeedback}</div>
      </div>
    );
  }
};
