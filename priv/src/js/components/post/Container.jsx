import Topbar from "../shared/Topbar";

export default {
  render() {
    return (
      <div>
        <Topbar />
        <RouterView />
      </div>
    );
  }
};
