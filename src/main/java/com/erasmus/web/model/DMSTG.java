package com.erasmus.web.model;

import java.util.Arrays;
import java.util.List;

/**
 * Η κλάση DMSTG περιέχει όλες τις συνεργαζόμενες χώρες και τα αντίστοιχα πανεπιστήμια
 * του Τμήματος Διοικητικής Επιστήμης και Τεχνολογίας (ΔΕΤ) στο πλαίσιο του προγράμματος Erasmus+.
 */
public class DMSTG {

    public static final List<String> BELGIUM = Arrays.asList(
        "Hasselt University",
        "University of Antwerpen"
    );

    public static final List<String> CYPRUS = Arrays.asList(
        "University of Cyprus",
        "University of Nicosia",
        "Cyprus University of Technology"
    );

    public static final List<String> DENMARK = Arrays.asList(
        "University of Southern Denmark"
    );

    public static final List<String> FINLAND = Arrays.asList(
        "Abo Akademi University",
        "Lahti University of Applied Sciences - LUT University - Lahti Campus",
        "University of Vaasa",
        "University of Jyvaskyla"
    );

    public static final List<String> FRANCE = Arrays.asList(
        "Audencia Group - Audencia Nantes School of Management",
        "ESC DIJON BOURGOGNE BSB / Burgundy School of Business",
        "University of Clermont Auvergne",
        "Université Paris Nanterre",
        "Université de Strasbourg - EM Strasbourg Business School",
        "Institut d'Études Politiques 'Sciences Po Toulouse'",
        "University of Tours",
        "SKEMA Business School"
    );

    public static final List<String> GERMANY = Arrays.asList(
        "University of Cologne",
        "University of Mannheim",
        "Philipps-University Marburg",
        "University of Siegen",
        "Technische Universität Hamburg - TUHH",
        "Technische Universität München",
        "Universität Ulm",
        "Technische Universität Dortmund",
        "Universität Hamburg",
        "SRH Hochschule Berlin - The International Management University",
        "Universität Koblenz",
        "Universität Münster - School of Business and Economics",
        "Hochschule München University of Applied Sciences"
    );

    public static final List<String> ITALY = Arrays.asList(
        "Università degli Studi di Catania",
        "Università degli Studi di Pavia",
        "Università Cattolica del Sacro Cuore",
        "Università degli Studi di Torino (ECOMAS)",
        "Università degli Studi di Torino - Dip. 'Valter Cantino' (SAA campus)"
    );

    public static final List<String> NETHERLANDS = Arrays.asList(
        "The Hague University of Applied Sciences - ESCM European Studies"
    );

    public static final List<String> NORWAY = Arrays.asList(
        "BI - Norwegian Business School",
        "Norwegian School of Economics - NHH"
    );

    public static final List<String> SLOVAKIA = Arrays.asList(
        "Univerzita Pavla Jozefa Safarika v Kosiciach"
    );

    public static final List<String> SWEDEN = Arrays.asList(
        "Stockholm University - Stockholm Business School",
        "Linnaeus University",
        "Kristianstad University",
        "Sodertorn University"
    );

    public static final List<String> TURKEY = Arrays.asList(
        "University of Istanbul"
    );

    /**
     * Επιστρέφει λίστα όλων των διαθέσιμων χωρών.
     */
    public static List<String> getAllCountries() {
        return Arrays.asList(
            "Belgium", "Cyprus", "Denmark", "Finland", "France",
            "Germany", "Italy", "Netherlands", "Norway", "Slovakia", "Sweden", "Turkey"
        );
    }
}
