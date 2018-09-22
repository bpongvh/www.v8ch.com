import moment from "moment";

export default {
  props: {
    post: {
      required: true,
      type: Object
    }
  },
  computed: {
    posted() {
      return moment(this.post.insertedAt).fromNow();
    }
  },
  render() {
    return (
      <div class="list-group-item">
        <div class="list-group-item__header">
          <h4>{this.post.title}</h4>
          <p>{this.posted}</p>
        </div>
        <div class="list-group-item__actions">
          <button class="btn btn-link" type="button">
            Edit
          </button>
          <button class="btn btn-link" type="button">
            Delete
          </button>
        </div>
      </div>
    );
  }
};
