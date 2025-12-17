<footer class="global-footer">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <div class="footer-content">
    <div class="social-icons">
      <a href="#"><i class="fab fa-facebook-f"></i></a>
      <a href="#"><i class="fab fa-twitter"></i></a>
      <a href="#"><i class="fab fa-instagram"></i></a>
    </div>

    <p>AUEB - DMST - ERASMUS +</p>
  </div>
</footer>

<style>
  .global-footer {
    background: linear-gradient(180deg, #003366 0%, #002b66 100%);
    color: white;
    text-align: center;
    padding: 1.8rem 0;
    font-family: 'Poppins', sans-serif;
    width: 100%;
    box-shadow: 0 -2px 10px rgba(0,0,0,0.25);
    margin-top: auto; /* 🟢 Fix για να κολλάει κάτω */
  }

  .footer-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 12px;
  }

  .social-icons {
    display: flex;
    gap: 18px;
  }

  .social-icons a {
    color: white;
    font-size: 1.25rem;
    transition: 0.3s ease;
  }

  .social-icons a:hover {
    color: #66b3ff;
    transform: scale(1.25);
  }

  .footer-content p {
    font-size: 0.9rem;
    color: #d6e4ff;
    margin: 0;
  }
</style>
