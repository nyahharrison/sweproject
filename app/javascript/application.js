console.log("showSlides function called");

document.addEventListener('DOMContentLoaded', function() {
  let slideIndex = -1;
  showSlides();

  function showSlides() {
    const slides = document.getElementsByClassName("mySlides");
    const dots = document.getElementsByClassName("dot");

    // Hide all slides
    for (let i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
    }

    // Increment index and reset to 0 if out of bounds
    slideIndex++;
    if (slideIndex >= slides.length) {
      slideIndex = 0;
    }

    // Show current slide and update dots
    slides[slideIndex].style.display = "block";
    for (let i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
    }
    dots[slideIndex].className += " active";

    // Set interval for slideshow (change slide every 3 seconds)
    setTimeout(showSlides, 3000);
  }
});
