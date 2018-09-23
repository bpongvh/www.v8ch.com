export const types = { SET_IS_CONTACT_SUBMITTED: "SET_IS_CONTACT_SUBMITTED" };

export default {
  [types.SET_IS_CONTACT_SUBMITTED](state) {
    return Object.assign(state, { isContactSubmitted: true });
  }
};
