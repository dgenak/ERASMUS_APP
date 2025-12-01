<footer class="global-footer">
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
  /* === FOOTER === */
  .global-footer {
    background: linear-gradient(180deg, #003366 0%, #002b66 100%);
    color: white;
    text-align: center;
    padding: 1.8rem 0;
    width: 100%;
    font-family: 'Poppins', sans-serif;
    box-shadow: 0 -2px 10px rgba(0,0,0,0.25);
    position: relative;
    bottom: 0;
    left: 0;
    z-index: 10;
   }


  .footer-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
  }

  .social-icons {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-bottom: 5px;
  }

  .social-icons a {
    color: #ffffff;
    font-size: 1.2rem;
    transition: all 0.3s ease;
  }

  .social-icons a:hover {
    color: #66b3ff;
    transform: scale(1.2);
  }

  .footer-content p {
    font-size: 0.9rem;
    color: #d6e4ff;
    margin: 0;
  }

  /* === RESPONSIVE === */
  @media (max-width: 600px) {
    .social-icons a {
      font-size: 1.1rem;
      gap: 12px;
    }

    .footer-content p {
      font-size: 0.8rem;
      line-height: 1.4;
    }
  }
</style>
