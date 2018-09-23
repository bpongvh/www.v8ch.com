import moment from "moment";

export default {
  props: {
    deletePost: {
      required: true,
      type: Function
    },
    editPost: {
      required: true,
      type: Function
    },
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
  methods: {
    onDelete() {
      this.deletePost(this.post.id);
    },
    onEdit() {
      this.editPost(this.post.id);
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
          <button
            class="btn btn-link"
            name="edit"
            onClick={this.onEdit}
            type="button"
          >
            Edit
          </button>
          <button
            class="btn btn-link"
            name="delete"
            onClick={this.onDelete}
            type="button"
          >
            Delete
          </button>
        </div>
      </div>
    );
  }
};
