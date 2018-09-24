const validatesInputMixin = {
  computed: {
    applyInvalidCssClass() {
      return (
        (this.isBlurred && !this.isValid) || (this.wasValid && !this.isValid)
      );
    },
    currentValue() {
      return this.value ? this.value : this.initialValue;
    },
    errorFeedback() {
      return this.validationFn(this.value);
    }
  },
  data() {
    return {
      isBlurred: false,
      isPreviewing: false,
      isValid: !this.required || !!this.initialValue,
      wasValid: false
    };
  },
  methods: {
    handleBlur() {
      if (!this.isBlurred) {
        this.isBlurred = true;
      }
    },
    handleInput(event) {
      const { name, value } = event.target;
      this.$emit("change", {
        isValid: !this.validationFn(value),
        name,
        value
      });
    }
  },
  mounted() {
    this.wasValid = !this.errorFeedback;
  },
  props: {
    initialValue: {
      default: "",
      type: String
    },
    label: {
      required: true,
      type: String
    },
    name: {
      required: true,
      type: String
    },
    required: {
      default: false,
      type: Boolean
    },
    validationFn: {
      required: true,
      type: Function
    },
    value: {
      required: true,
      type: String
    }
  },
  watch: {
    errorFeedback(current) {
      // Insure wasValid is true if we ever have errorFeedback === null
      if (!current && !this.wasValid) {
        this.wasValid = true;
      }
      this.isValid = !current;
    }
  }
};

export default validatesInputMixin;
