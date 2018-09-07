export const types = {
  PUSH_ERROR: "PUSH_ERROR",
  SET_TOKENS: "SET_TOKENS"
};

export default {
  [types.PUSH_ERROR](state, payload) {
    const errors = [...state.errors];
    errors.push(payload.error);
    return Object.assign(state, { errors });
  },
  [types.SET_TOKENS](state, { tokens }) {
    return Object.assign(state, { tokens });
  }
};
