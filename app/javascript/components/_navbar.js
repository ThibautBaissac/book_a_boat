const navbarOpacity = () => {
  const navbar = document.querySelector(".navbar-lewagon");

  document.addEventListener('scroll', (event) => {
    const scrollPositionY = window.scrollY;
    if(scrollPositionY >= 10) {
      navbar.classList.add("scroll");
    } else {
      navbar.classList.remove("scroll");
    }
  });
}

export { navbarOpacity }
