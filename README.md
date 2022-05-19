<!-- PROJECT SHIELDS -->
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/jaredfiacco2/AWS-E-Scooter-Tracker">
    <img src="images/scooter.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Use AWS Lambda to pull E-Scooter/Bike Location Data, store in Redshift Data Vault. Serve to Google Data Studio Dashboard.</h3>

  <p align="center">
    This code takes a list of E-Scooter APIs stored in a JSON file and uses AWS Cloudwatch & SNS to run Python in Lambda to GET them, store them in AWS in a S3 Data Lake and a Redshift Data Warehouse using a Data Vault Data Model. Then it serves the data in a Google Data Studio Dashboard.  
    <br />
    <br />
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#prerequisites">Prerequisites/Instructions</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

- Personal mobility devices are changing transportation in major cities. This data is publically available from various companies via APIs if you spend the time and money to collect it. This project collects and tracks scooter data from companies over time using AWS and implementing Data Vault data modeling.

- I take various E-Scooter Scooter APIs, use AWS to pull and store data (Cloud Watch, SNS, Lambda, S3, Redshift) and serve a dashboard using Google Data Studio.  

<img src="images\ProcessMap.png" alt="Process Map"/>

### Built With

- Tech
* [Python](https://python.org)
* [Pandas](https://pandas.pydata.org/)
* [AWS Cloud Watch](https://firebase.google.com/docs/firestore)
* [AWS SNS](https://firebase.google.com/docs/firestore)
* [AWS Lambda](https://firebase.google.com/docs/firestore)
* [AWS S3](https://firebase.google.com/docs/firestore)
* [AWS Redshift](https://firebase.google.com/docs/firestore)
* [GCP Data Studio](https://datastudio.google.com/)
* [JSON](https://en.wikipedia.org/wiki/JSON)

- E-Scooter/Bike APIs (7 APIs, 48 Locations)
* []()
* []()
* []()
* []()
* []()
* []()
* []()

### Prerequisites

1. Installing all Required Packages
  ```sh
  pip install -r requirements.txt
  ```

2. Open a Google Cloud Platform Account and a firebase account. 

3. Download a [admin sdk json file](https://firebase.google.com/docs/admin/setup#python) to access firebase. Download the file and replace the firebase-adminsdk.json file in your repo. Adjust "cred" variable in loadToFirebase_gitVersion.py file to match the name of your credentials file.
<img src="images\firebase_key.gif" alt="getFirebaseKey" />

4. Check access to [RSS Feed](https://darknetdiaries.com/feedfree.xml).
<img src="images\xml.gif" alt="xml" />

5. Run loadToFirebase.py in python. This step took my computer well over 24 hours for the 100+ hours in the DarkNet Diaries Podcast.
  ```sh
  python loadToFirebase_gitVersion.py
  ```
6. Check Firebase to make sure the data went through.
<img src="images\firebase.gif" alt="firebase" />

7. Use Jupyter Notebook and pandas to play wit the pickle data!
<img src="images\pandas.gif" alt="pandas" />

<!-- CONTACT -->
## Contact

[Jared Fiacco](https://www.linkedin.com/in/jaredfiacco/) - jaredfiacco2@gmail.com

Another GCP Project of Mine: [Publish Computer Statistics to Pub/Sub, Use Cloud Functions to Store in BigQuery](https://github.com/jaredfiacco2/ComputerMonitoring_IOT)






<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/jaredfiacco/