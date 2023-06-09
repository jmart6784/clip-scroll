const formatDate = (d, format = "pretty") => {
  let date = new Date();
  format == "epoch" ? (date = new Date(d * 1000)) : (date = new Date(d));

  var monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  return (
    monthNames[date.getMonth()] +
    " " +
    date.getDate() +
    ", " +
    date.getFullYear()
  );
};

export default formatDate;
