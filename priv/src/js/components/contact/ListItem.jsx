import moment from "moment";

export default {
  props: {
    contact: {
      required: true,
      type: Object
    }
  },
  computed: {
    posted() {
      return moment(this.contact.insertedAt).fromNow();
    }
  },
  render() {
    return (
      <div class="list-group-item">
        <div class="list-group-item__header">
          <h4>{this.contact.email}</h4>
          <p>{this.posted}</p>
        </div>
        <p>{this.contact.message}</p>
        <div class="list-group-item__actions">
          <button class="btn btn-link" type="button">
            Delete
          </button>
        </div>
      </div>
    );
  }
};
