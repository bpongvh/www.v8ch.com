export default {
  props: {
    icon: {
      required: true,
      type: String
    },
    doAction: {
      required: true,
      type: Function
    }
  },
  render() {
    return (
      <button onClick={this.doAction} class="btn btn-link" type="button">
        <font-awesome-icon icon={this.icon} />
      </button>
    );
  }
};
