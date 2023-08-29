import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      // event.preventDefault();
      swal(options).then(function(){
        window.location = `/challenges/${swalButton.dataset.challenge}/dares/${swalButton.dataset.dare}`;
        // console.dir(swalButton.dataset);
        // console.log(swalButton.dataset.dare);
      });
    });
  }
};
export { initSweetalert };




