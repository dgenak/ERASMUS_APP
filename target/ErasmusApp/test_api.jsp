<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <title>API Test Page</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background: #f1f5ff;
        }

        h1 {
            color: #003366;
        }

        h2 {
            margin-top: 30px;
        }

        a {
            font-size: 1.1rem;
            display: block;
            margin-bottom: 12px;
            text-decoration: none;
            color: #0044bb;
        }

        a:hover {
            text-decoration: underline;
            color: #001a66;
        }

        .box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.15);
            max-width: 700px;
        }
    </style>
</head>

<body>

    <div class="box">
        <h1>API Test Page</h1>

        <h2>1. Countries</h2>
        <a href="api/universities/countries" target="_blank">
            api/universities/countries
        </a>

        <h2>2. Universities by Country (Belgium)</h2>
        <a href="api/universities/byCountry?country=Belgium" target="_blank">
            api/universities/byCountry?country=Belgium
        </a>

        <h2>3. DMST Courses</h2>
        <a href="api/universities/dmstCourses" target="_blank">
            api/universities/dmstCourses
        </a>

        <h2>4. Mapping Example</h2>
        <a href="api/universities/mapping?university=Hasselt University&dmstCourse=Πληροφορική Ι" target="_blank">
            api/universities/mapping?university=Hasselt University&dmstCourse=Πληροφορική Ι
        </a>
    </div>

</body>
</html>
