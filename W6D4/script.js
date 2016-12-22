document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const addLi = (e) => {
    e.preventDefault();
    const form = e.target;
    const input = document.querySelector('.favorite-input');
    const ul = document.getElementById('sf-places');
    const li = document.createElement("li");
    li.textContent = input.value;
    input.value = "";

    ul.appendChild(li);
  };

  document.querySelector(".list-container form")
          .addEventListener("submit", addLi);

  // adding new photos

  const toggleHidden = (e) => {
    const form = document.querySelector(".photo-form-container");
    if (form.className.includes("hidden")) {
      form.className = form.className.replace(" hidden", "");
    } else {
      form.className = form.className + " hidden";
    }
  };

  document.querySelector(".photo-show-button")
          .addEventListener("click", toggleHidden);

  const addImg = (e) => {
    e.preventDefault();
    const form = e.target.parentElement;
    const input = form.querySelector('.photo-url-input');
    const ul = document.querySelector('.dog-photos');
    const li = document.createElement("li");
    const img = document.createElement("img");

    img.setAttribute("src", input.value);
    li.appendChild(img);
    ul.appendChild(li);

    input.value = "";

  };

  document.querySelector(".photo-url-submit")
          .addEventListener("click", addImg);
});
