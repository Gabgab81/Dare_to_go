const alerte_failed = () => {
  fetch('/alertes', { headers: { accept: "application/json" } })
    .then(response => response.json())
    .then((data) => {
      // console.log(data.alertes);
      if (data.alertes != null) {
        swal({
          title: "Time's up!",
          text: `${data.alertes} is over. Don't worry, next time, you will make it!`,
          icon: "error"
        });
      };
    });
}

export { alerte_failed };
