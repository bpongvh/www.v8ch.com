export default function(properties, id = null) {
  const formData = Object.keys(properties).reduce((accumulator, property) => {
    return Object.assign(accumulator, {
      [property]: properties[property].value
    });
  }, {});
  if (id) {
    return Object.assign(formData, { id: parseInt(id, 10) });
  }
  return formData;
}
