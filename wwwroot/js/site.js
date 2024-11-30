function previewImage(event) {
  const file = event.target.files[0];
  const preview = document.getElementById('image-preview');
  
  if (file) {
    const reader = new FileReader();
    reader.onload = function(e) {
      preview.style.backgroundImage = `url('${e.target.result}')`;
      preview.style.backgroundSize = 'cover';
      preview.style.backgroundPosition = 'center';
      preview.innerHTML = ''; 
    };
    reader.readAsDataURL(file);
  }
}

function toggleForm() {
  var enBD = document.getElementById("enBD").value;
  var bookForm = document.getElementById("bookForm");
  var bookSelection = document.getElementById("bookSelection");
  if (enBD === "No") {
      bookForm.style.display = "block";       
      bookSelection.style.display = "none";
  } else if (enBD === "Sí") {
      bookForm.style.display = "none";        
      bookSelection.style.display = "block";  
  } else {
      bookForm.style.display = "none";        
      bookSelection.style.display = "none";
  }
  $('#loginForm').submit(function(event) {
      event.preventDefault();
  });
}

function removeItem(itemId) {
  if (confirm("¿Estás seguro de que deseas eliminar este artículo del carrito?")) {
      fetch('/Home/RemoveItem', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
          },
          body: JSON.stringify({ id: itemId }),
      })
      .then(response => {
          if (response.ok) {
              document.querySelector(`.cart-item[data-id="${itemId}"]`).remove(); // Remove from DOM
          } else {
              alert("No se pudo eliminar el artículo. Inténtalo de nuevo.");
          }
      })
      .catch(error => {
          console.error('Error:', error);
          alert("Ocurrió un error al intentar eliminar el artículo.");
      });
  }
}

