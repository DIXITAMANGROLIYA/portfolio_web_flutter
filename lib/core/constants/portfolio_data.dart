class PortfolioData {
  // Personal Information
  static const String name = 'Dixita Mangroliya';
  static const String title = 'Software Developer';
  static const String title1 = 'Flutter | Dart | Android | Kotlin';
  static const String subtitle = 'Mobile Application Developer | 2+ Years Experience';
  static const String email = 'dixitahmangroliya@gmail.com';
  static const String linkedin = 'linkedin.com/in/dixitamangroliya12';
  static const String github = 'github.com/dixitamangroliya';
  static const String location = 'Surat, Gujarat';

  // Summary
  static const String summary =
      "I am a Mobile Application Developer with 2+ years of experience building "
      "production-ready mobile applications using Flutter and native Android (Kotlin). "
      "I have worked on end-to-end app development including UI implementation, "
      "state management, API integration, Firebase services, and real-time features.\n\n"

      "My experience includes working with Bloc for scalable state management, "
      "integrating RESTful APIs, Firebase Authentication, Cloud Firestore, "
      "push notifications, and WebSocket-based real-time communication. "
      "I am comfortable collaborating in agile teams using GitHub and Jira, "
      "and I focus on writing clean, maintainable, and performance-oriented code.\n\n"

      "I have contributed to live applications used by real users and enjoy "
      "building intuitive user experiences while solving real-world problems "
      "through technology.";

  // Experience
  static const List<Experience> experiences = [
    Experience(
      company: 'Square Infosoft',
      position: 'Flutter Developer',
      duration: 'August 2024 – Present',
      location: 'Surat',
      responsibilities: [
        'Developed and maintained multiple Flutter applications for client projects in a production environment.',
        'Worked on apps like Goorvi and Go Someplace, handling UI development, state management, and API integration.',
        'Integrated REST APIs, Firebase Authentication, WebSocket-based real-time features, and local notifications.',
      ],
    ),
    Experience(
      company: 'Square Infosoft',
      position: 'Application Development Intern',
      duration: 'February 2024 – July 2024',
      location: 'Surat',
      responsibilities: [
        'Developed Flutter features for client applications during internship.',
        'Worked on projects such as Alarm App, Visit College, and Event Management systems.',
        'Gained hands-on experience with Flutter, Android lifecycle, API integration, and Firebase Authentication.',
      ],
    ),
    Experience(
      company: 'Aani Brothers Infotech',
      position: 'Android Development Intern',
      duration: 'April 2023 – May 2023',
      location: 'Surat',
      responsibilities: [
        'Developed an Android Kitchen Recipe application with like and unlike functionality.',
        'Implemented local storage using RoomDB and handled API calls using Retrofit.',
      ],
    ),
  ];

  // Education
  static const List<Education> educations = [
    Education(
      institution: 'Sardar Vallabhbhai Patel Institute of Technology (GTU)',
      degree: 'Bachelor of Engineering in Information Technology',
      duration: '2020 – 2024',
      location: 'Vasad, Gujarat',
    ),
    Education(
      institution: 'P.P.Savani Vidhyabhavan',
      degree: 'HSC',
      duration: '2020',
      location: 'Surat',
    ),
  ];

  // Technical Skills
  static const List<String> technicalSkills = [
    'Flutter',
    'Dart',
    'State Management (Bloc, GetX)',
    'Firebase (Auth, Firestore)',
    'REST API Integration',
    'WebSocket (Socket.io)',
    'SQLite (Local Storage)',
    'Android (Kotlin)',
    'Postman (API Testing)',
    'GitHub',
  ];

  // Projects
  static final List<Project> projects = [
    Project(
      title: 'ClimaPal',
      subtitle: 'AI-based Outfit & Travel Recommendation App',
      technologies: [
        'Flutter',
        'Bloc',
        'REST APIs',
        'Firebase',
        'Weather APIs',
      ],
      description: [
        'Led end-to-end development of a production mobile application providing outfit and travel recommendations based on real-time weather conditions.',
        'Acted as the primary point of contact for clients, gathering requirements, clarifying expectations, and translating business needs into technical solutions.',
        'Designed application architecture and implemented scalable state management using Bloc.',
        'Integrated multiple APIs for weather data, recommendations, and dynamic content updates.',
        'Managed feature planning, task distribution, and delivery timelines as team lead.',
      ],
    ),

    Project(
      title: 'GoSomeplace',
      subtitle: 'Travel Discovery & Planning Application',
      technologies: [
        'Flutter',
        'Firebase',
        'REST APIs',
        'WebSocket',
        'Local Notifications',
      ],
      description: [
        'Worked as part of a development team on a live travel application used for trip planning and discovery.',
        'Implemented core features including real-time chat, content sharing, likes, and user interactions.',
        'Integrated REST APIs and Firebase Authentication for secure user management.',
        'Implemented WebSocket-based real-time messaging for chat functionality.',
        'Collaborated with designers and backend developers to deliver features under tight deadlines.',
      ],
    ),

    Project(
      title: 'FormulaP',
      subtitle: 'Formula 1 Race Results & Driver Information App',
      technologies: [
        'Flutter',
        'REST APIs',
        'Firebase',
      ],
      description: [
        'Worked on a production mobile application providing Formula 1 race results, driver details, and related statistics.',
        'Communicated directly with the client to understand feature change requests and clarify business requirements.',
        'Implemented feature updates and UI changes based on client feedback and evolving app requirements.',
        'Ensured app stability and consistency while modifying existing features in a live codebase.',
      ],
    ),
  ];

  // Languages
  static const List<String> languages = [
    'English (Professional)',
    'Hindi',
    'Gujarati (Native)',
  ];
}

class Experience {
  final String company;
  final String position;
  final String duration;
  final String location;
  final List<String> responsibilities;

  const Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.location,
    required this.responsibilities,
  });
}

class Education {
  final String institution;
  final String degree;
  final String duration;
  final String location;

  const Education({
    required this.institution,
    required this.degree,
    required this.duration,
    required this.location,
  });
}

class Project {
  final String title;
  final String subtitle;
  final List<String> technologies;
  final List<String> description;

  const Project({
    required this.title,
    required this.subtitle,
    required this.technologies,
    required this.description,
  });
}