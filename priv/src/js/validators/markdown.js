const markdownValidationFn = (label, isRequired) => value => {
  if (isRequired && value === "") {
    return `${label} is required.`;
  }
  return null;
};

export default markdownValidationFn;
