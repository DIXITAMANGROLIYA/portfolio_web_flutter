# Dixita Mangroliya - Flutter Developer Portfolio

A professional, responsive portfolio website built with Flutter Web showcasing my experience as a Mobile Application Developer.

## 🌟 Features

### Professional Design
- **Modern UI/UX**: Clean, minimalist design with warm color palette
- **Responsive Layout**: Optimized for desktop, tablet, and mobile devices
- **Smooth Animations**: Hover effects, transitions, and micro-interactions
- **Professional Typography**: Google Fonts (Poppins) for excellent readability

### Portfolio Sections
- **Hero Section**: Eye-catching introduction with animated background
- **About Me**: Professional summary with quick stats and languages
- **Experience**: Timeline-based work history with detailed responsibilities
- **Education**: Academic background and qualifications
- **Technical Skills**: Categorized skills with interactive chips
- **Featured Projects**: Expandable project cards with detailed descriptions
- **Contact**: Contact form and social links

### Technical Highlights
- **Flutter Web**: Built with Flutter 3.32.8 for web deployment
- **Responsive Design**: Uses flutter_screenutil for consistent scaling
- **Material Design 3**: Modern design system implementation
- **Custom Animations**: Smooth hover effects and transitions
- **SEO Optimized**: Proper meta tags and structured content

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.32.8 or higher)
- Chrome browser for web development
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/dixitamangroliya/portfolio_web_flutter.git
   cd portfolio_web_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the development server**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production**
   ```bash
   flutter build web --release
   ```

## 🎨 Design System

### Color Palette
- **Background**: `#F6F1EC` (Warm beige)
- **Surface**: `#FFFFFF` (Pure white)
- **Primary Text**: `#2E2A28` (Dark brown)
- **Secondary Text**: `#7A6F68` (Medium brown)
- **Accent**: `#9C7C6D` (Warm brown)
- **Accent Soft**: `#E6DAD3` (Light beige)

### Typography
- **Font Family**: Poppins (Google Fonts)
- **Headings**: 600-700 weight
- **Body Text**: 400-500 weight
- **Responsive Sizing**: Scales with screen size

## 📱 Responsive Breakpoints

- **Desktop**: 1440px+ (Primary design target)
- **Tablet**: 768px - 1439px
- **Mobile**: 320px - 767px

## 🛠️ Technologies Used

- **Flutter**: 3.32.8
- **Dart**: Latest stable
- **flutter_screenutil**: Responsive design
- **google_fonts**: Typography
- **url_launcher**: External links (planned)

## 📂 Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_color.dart          # Color definitions
│   │   └── portfolio_data.dart     # Content data
│   ├── theme/
│   │   └── app_theme.dart          # Theme configuration
│   └── widgets/
│       ├── animated_card.dart      # Reusable animated card
│       ├── section_header.dart     # Section headers
│       └── skill_chip.dart         # Skill chips
├── sections/
│   ├── about_section.dart          # About me section
│   ├── contact_section.dart        # Contact form & info
│   ├── education_section.dart      # Education background
│   ├── experience_section.dart     # Work experience
│   ├── home_section.dart           # Hero section
│   ├── main_layout.dart            # Main layout wrapper
│   ├── navbar.dart                 # Navigation bar
│   ├── projects_section.dart       # Featured projects
│   └── skills_section.dart         # Technical skills
├── main.dart                       # App entry point
└── app.dart                        # App configuration
```

## 🎯 Key Features Implemented

### Enhanced Home Section
- Animated background pattern
- Professional avatar placeholder
- Call-to-action buttons
- Smooth entrance animations

### Interactive About Section
- Professional summary
- Quick statistics cards
- Language proficiency
- Hover animations

### Experience Timeline
- Visual timeline design
- Expandable experience cards
- Detailed responsibility lists
- Company and duration info

### Skills Showcase
- Categorized skill groups
- Interactive skill chips
- Icon-based visual hierarchy
- Hover effects

### Project Portfolio
- Expandable project cards
- Technology stack display
- Detailed feature descriptions
- Professional presentation

### Contact Integration
- Contact form (ready for backend)
- Social media links
- Professional contact info
- Interactive elements

## 🚀 Deployment

### Firebase Hosting (Recommended)
```bash
flutter build web --release
firebase init hosting
firebase deploy
```

### Netlify
```bash
flutter build web --release
# Upload build/web folder to Netlify
```

### GitHub Pages
```bash
flutter build web --release --base-href "/portfolio_web_flutter/"
# Push build/web contents to gh-pages branch
```

## 📈 Performance Optimizations

- **Lazy Loading**: Sections load as needed
- **Optimized Images**: Compressed assets
- **Efficient Animations**: Hardware-accelerated transforms
- **Minimal Dependencies**: Only essential packages
- **Web-Optimized Build**: Production-ready compilation

## 🔧 Customization

### Updating Content
Edit `lib/core/constants/portfolio_data.dart` to update:
- Personal information
- Work experience
- Education details
- Projects
- Skills
- Contact information

### Changing Colors
Modify `lib/core/constants/app_color.dart` for color scheme changes.

### Adding Sections
1. Create new section widget in `lib/sections/`
2. Add to `main_layout.dart`
3. Update navigation in `navbar.dart`

## 📞 Contact

- **Email**: dixitahmangroliya@gmail.com
- **LinkedIn**: [linkedin.com/in/dixitamangroliya12](https://linkedin.com/in/dixitamangroliya12)
- **GitHub**: [github.com/dixitamangroliya](https://github.com/dixitamangroliya)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Built with ❤️ using Flutter Web**
