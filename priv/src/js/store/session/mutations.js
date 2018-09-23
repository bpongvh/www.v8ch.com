export const types = {
  PUSH_ERROR: "PUSH_ERROR",
  SET_TOKENS: "SET_TOKENS",
  TOGGLE_OFFCANVAS: "TOGGLE_OFFCANVAS"
};

export default {
  [types.PUSH_ERROR](state, payload) {
    const errors = [...state.errors];
    errors.push(payload.error);
    return Object.assign(state, { errors });
  },
  [types.SET_TOKENS](state, { tokens }) {
    return Object.assign(state, { tokens });
  },
  [types.TOGGLE_OFFCANVAS](state) {
    return Object.assign(state, {
      isOffcanvasShowing: !state.isOffcanvasShowing
    });
  }
};
