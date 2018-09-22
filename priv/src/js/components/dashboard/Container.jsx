import ContactListItem from "../contact/ListItem";
import PostListItem from "../post/ListItem";
import ActionButton from "../shared/ActionButton";
import ContentList from "../shared/ContentList";
import Topbar from "../shared/Topbar";
import queries from "../../graphql/queries";

export default {
  apollo: {
    contacts: queries.LIST_CONTACTS,
    posts: queries.LIST_POSTS
  },
  methods: {
    addPost() {
      this.$router.push("/post/add");
    },
    editPost(id) {
      console.log(`[DashboardContainer] editPost() id: ${JSON.stringify(id)}`);
      this.$router.push(`/post/${id}/edit`);
    }
  },
  render() {
    return (
      <div>
        <Topbar />
        <header class="section-header">
          <h2>Dashboard</h2>
        </header>
        <main class="container">
          <ContentList title="Contacts">
            {this.contacts &&
              this.contacts.map(contact => (
                <ContactListItem contact={contact} key={contact.id} />
              ))}
          </ContentList>
          <ContentList>
            <div class="content-list__header content-list__header--action">
              <h3>Recent Posts</h3>
              <ActionButton doAction={this.addPost} icon="plus" />
            </div>
            {this.posts &&
              this.posts.map(post => (
                <PostListItem
                  editPost={id => this.editPost(id)}
                  key={post.id}
                  post={post}
                />
              ))}
          </ContentList>
        </main>
      </div>
    );
  }
};
