<img width="406" height="117" alt="image" src="https://github.com/user-attachments/assets/831b2861-b07a-4709-849a-c205a98dd3d6" />


<a id="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h3 align="center">UniEra — Erasmus Web App</h3>

  <p align="center">
    Web πλατφόρμα για φοιτητές Erasmus, σε συνεργασία με το Οικονομικό Πανεπιστήμιο Αθηνών (AUEB)
    <br />
    <a href="https://github.com/dgenak/ERASMUS_APP"><strong>Explore the repo »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dgenak/ERASMUS_APP/issues">Report Bug</a>
    &middot;
    <a href="https://github.com/dgenak/ERASMUS_APP/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

Η **UniEra** είναι μια web εφαρμογή που δημιουργήθηκε σε συνεργασία με το Οικονομικό Πανεπιστήμιο Αθηνών (AUEB), με στόχο να διευκολύνει τους φοιτητές που συμμετέχουν στο πρόγραμμα Erasmus. Η εφαρμογή επιτρέπει την αναζήτηση συνεργαζόμενων πανεπιστημίων, την αντιστοίχιση μαθημάτων εξωτερικού με μαθήματα του τμήματος, τη διαχείριση αιτήσεων και Learning Agreements, καθώς και τη συμμετοχή σε ένα forum όπου οι φοιτητές μπορούν να θέτουν ερωτήσεις και να μοιράζονται εμπειρίες.

Η ιδέα προέκυψε από την ανάγκη να υπάρχει ένα κεντρικό σημείο πληροφόρησης για τους φοιτητές που ετοιμάζονται για Erasmus, αντί να ψάχνουν αντιστοιχίες και έγγραφα σκόρπια σε διαφορετικές πηγές.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [Java 8](https://www.oracle.com/java/)
* [Jakarta Servlets & JSP](https://projects.eclipse.org/projects/ee4j.servlet)
* [Apache Maven](https://maven.apache.org/)
* [Apache Tomcat](https://tomcat.apache.org/)
* [MySQL](https://www.mysql.com/)
* [Gson](https://github.com/google/gson)
* [JSTL](https://projects.eclipse.org/projects/ee4j.jstl)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

Ακολουθούν οδηγίες για να στήσεις τοπικά ένα αντίγραφο του project για development και testing.

### Prerequisites

Χρειάζεσαι τα παρακάτω εγκατεστημένα στο μηχάνημά σου:

* JDK 8
* Apache Maven
* Apache Tomcat (servlet container, συμβατό με Servlet API 2.5)
* MySQL

### Installation

1. Δημιούργησε τη βάση δεδομένων MySQL για το project
2. Κάνε clone το repo
   ```sh
   git clone https://github.com/dgenak/ERASMUS_APP.git
   ```
3. Ρύθμισε τα στοιχεία σύνδεσης στη βάση στο `src/main/resources/application.properties`
   ```
   db.url=jdbc:mysql://localhost:3306/erasmus_app
   db.username=your_username
   db.password=your_password
   ```
4. Χτίσε το project με Maven
   ```sh
   mvn clean package
   ```
5. Ανέβασε το παραγόμενο `target/ErasmusApp.war` στον φάκελο `webapps` του Tomcat
   ```sh
   cp target/ErasmusApp.war $CATALINA_HOME/webapps/
   ```
6. Άλλαξε το git remote url ώστε να αποφύγεις τυχαία push στο αρχικό repo (αν κάνεις fork)
   ```sh
   git remote set-url origin github_username/repo_name
   git remote -v # confirm the changes
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

Μετά το deployment, άνοιξε τον browser στο `http://localhost:8080/ErasmusApp/`. Θα εμφανιστεί η σελίδα σύνδεσης, όπου μπορείς να εγγραφείς ως νέος χρήστης.

Μόλις συνδεθείς, μπορείς να:
- Περιηγηθείς στη λίστα συνεργαζόμενων πανεπιστημίων και να δεις λεπτομέρειες για το καθένα
- Αντιστοιχίσεις μαθήματα εξωτερικού με μαθήματα του τμήματος (6ο/7ο εξάμηνο)
- Υποβάλεις αίτηση συμμετοχής και να συμπληρώσεις το Learning Agreement
- Συμμετάσχεις στο forum, ρωτώντας ή απαντώντας σε άλλους φοιτητές
- Κατεβάσεις χρήσιμα έγγραφα (Erasmus Policy Statement, Student Charter κ.ά.)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [ ] Migration σε Spring Boot για καλύτερη συντηρησιμότητα
- [ ] Αναβάθμιση frontend με JavaScript framework
- [ ] Ενοποίηση παλιών εκδόσεων σελίδων (`applications_old.jsp`, `forumOld.jsp`)
- [ ] Προσθήκη automated tests
- [ ] Responsive design για κινητά

See the [open issues](https://github.com/dgenak/ERASMUS_APP/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

[Το όνομά σου] - [email@example.com](mailto:email@example.com)

Project Link: [https://github.com/dgenak/ERASMUS_APP](https://github.com/dgenak/ERASMUS_APP)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Οικονομικό Πανεπιστήμιο Αθηνών (AUEB)](https://www.aueb.gr/) — για τη συνεργασία στο σχεδιασμό του project
* [Choose an Open Source License](https://choosealicense.com/)
* [Img Shields](https://shields.io/)
* README structure βασισμένο στο [Best-README-Template](https://github.com/othneildrew/Best-README-Template) του Othneil Drew

<p align="right">(<a href="#readme-top">back to top</a>)</p>
