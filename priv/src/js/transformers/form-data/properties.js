export default function(properties) {
  return Object.keys(properties).reduce((accumulator, property) => {
    return Object.assign(accumulator, {
      [property]: properties[property].value
    });
  }, {});
}
