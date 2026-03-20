"<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>Bearitage - Unite with Innovation, Aspire the Greater Generation</title>
    <script src=\"https://cdn.tailwindcss.com\"></script>
    <style>
        /* Custom Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap');
        
        * {
            font-family: 'Inter', sans-serif;
        }
        
        /* Smooth Scroll */
        html {
            scroll-behavior: smooth;
        }
        
        /* Custom Colors */
        :root {
            --color-beige: #F5E6D3;
            --color-cream: #FAF3E0;
            --color-gold: #D4AF37;
            --color-brown: #6B4423;
            --color-brown-light: #8B6F47;
            --color-brown-dark: #543318;
        }
        
        /* Custom Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }
        
        .animate-fade-in {
            animation: fadeIn 0.6s ease-out;
        }
        
        .animate-bounce-slow {
            animation: bounce 2s ease-in-out infinite;
        }
        
        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 10px;
        }
        
        ::-webkit-scrollbar-track {
            background: var(--color-cream);
        }
        
        ::-webkit-scrollbar-thumb {
            background: var(--color-gold);
            border-radius: 5px;
        }
        
        ::-webkit-scrollbar-thumb:hover {
            background: #B8941F;
        }
        
        /* Hide scrollbar for modal backdrop */
        .modal-open {
            overflow: hidden;
        }
        
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.6);
            backdrop-filter: blur(5px);
        }
        
        .modal.active {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }
        
        .modal-content {
            background-color: white;
            border-radius: 1rem;
            max-width: 1000px;
            width: 100%;
            max-height: 90vh;
            overflow-y: auto;
            animation: fadeIn 0.3s ease-out;
        }
        
        /* Mobile Menu */
        .mobile-menu {
            display: none;
        }
        
        .mobile-menu.active {
            display: block;
        }
        
        /* Line Clamp */
        .line-clamp-2 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        /* Gradient Background Pattern */
        .pattern-bg {
            background-image: url(\"data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%236B4423' fill-opacity='0.05'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E\");
        }
    </style>
</head>
<body class=\"bg-white\">

    <!-- Navigation -->
    <nav id=\"navbar\" class=\"fixed top-0 left-0 right-0 z-50 transition-all duration-300\">
        <div class=\"max-w-7xl mx-auto px-4 sm:px-6 lg:px-8\">
            <div class=\"flex items-center justify-between h-20\">
                <!-- Logo -->
                <div class=\"flex items-center space-x-3 cursor-pointer\" onclick=\"scrollToSection('home')\">
                    <div class=\"w-12 h-12 rounded-full flex items-center justify-center text-2xl\" style=\"background-color: var(--color-gold);\">
                        🐻
                    </div>
                    <div>
                        <h1 class=\"text-2xl font-bold\" style=\"color: var(--color-brown);\">Bearitage</h1>
                    </div>
                </div>

                <!-- Desktop Navigation -->
                <div class=\"hidden md:flex items-center space-x-8\">
                    <a href=\"#home\" onclick=\"scrollToSection('home')\" class=\"nav-link font-medium transition-colors duration-200\" style=\"color: var(--color-brown);\">Home</a>
                    <a href=\"#products\" onclick=\"scrollToSection('products')\" class=\"nav-link font-medium transition-colors duration-200\" style=\"color: var(--color-brown);\">Products</a>
                    <a href=\"#mission\" onclick=\"scrollToSection('mission')\" class=\"nav-link font-medium transition-colors duration-200\" style=\"color: var(--color-brown);\">Mission</a>
                    <a href=\"#gallery\" onclick=\"scrollToSection('gallery')\" class=\"nav-link font-medium transition-colors duration-200\" style=\"color: var(--color-brown);\">Gallery</a>
                    <a href=\"#testimonials\" onclick=\"scrollToSection('testimonials')\" class=\"nav-link font-medium transition-colors duration-200\" style=\"color: var(--color-brown);\">Testimonials</a>
                    <a href=\"#contact\" onclick=\"scrollToSection('contact')\" class=\"nav-link font-medium transition-colors duration-200\" style=\"color: var(--color-brown);\">Contact</a>
                </div>

                <!-- Mobile Menu Button -->
                <button id=\"mobile-menu-btn\" class=\"md:hidden transition-colors\" style=\"color: var(--color-brown);\">
                    <svg class=\"w-7 h-7\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\">
                        <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M4 6h16M4 12h16M4 18h16\"></path>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div id=\"mobile-menu\" class=\"mobile-menu md:hidden border-t\" style=\"background-color: var(--color-cream); border-color: rgba(212, 175, 55, 0.2);\">
            <div class=\"px-4 py-4 space-y-3\">
                <a href=\"#home\" onclick=\"scrollToSection('home')\" class=\"block px-4 py-2 rounded-lg transition-colors\" style=\"color: var(--color-brown);\">Home</a>
                <a href=\"#products\" onclick=\"scrollToSection('products')\" class=\"block px-4 py-2 rounded-lg transition-colors\" style=\"color: var(--color-brown);\">Products</a>
                <a href=\"#mission\" onclick=\"scrollToSection('mission')\" class=\"block px-4 py-2 rounded-lg transition-colors\" style=\"color: var(--color-brown);\">Mission</a>
                <a href=\"#gallery\" onclick=\"scrollToSection('gallery')\" class=\"block px-4 py-2 rounded-lg transition-colors\" style=\"color: var(--color-brown);\">Gallery</a>
                <a href=\"#testimonials\" onclick=\"scrollToSection('testimonials')\" class=\"block px-4 py-2 rounded-lg transition-colors\" style=\"color: var(--color-brown);\">Testimonials</a>
                <a href=\"#contact\" onclick=\"scrollToSection('contact')\" class=\"block px-4 py-2 rounded-lg transition-colors\" style=\"color: var(--color-brown);\">Contact</a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id=\"home\" class=\"relative min-h-screen flex items-center justify-center overflow-hidden pattern-bg\" style=\"background: linear-gradient(to bottom right, var(--color-cream), var(--color-beige), #E8D5C4);\">
        <div class=\"relative z-10 max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 text-center pt-20\">
            <!-- Logo -->
            <div class=\"mb-8 animate-fade-in\">
                <div class=\"w-32 h-32 mx-auto mb-6 relative\">
                    <div class=\"absolute inset-0 rounded-full blur-2xl opacity-30 animate-pulse\" style=\"background-color: var(--color-gold);\"></div>
                    <div class=\"relative w-full h-full bg-white rounded-full shadow-2xl flex items-center justify-center border-4\" style=\"border-color: var(--color-gold);\">
                        <span class=\"text-6xl\">🐾</span>
                    </div>
                </div>
            </div>

            <!-- Company Name -->
            <h1 class=\"text-6xl md:text-8xl font-bold mb-6 tracking-tight\" style=\"color: var(--color-brown);\">
                Bearitage
            </h1>

            <!-- Motto -->
            <div class=\"max-w-3xl mx-auto mb-12\">
                <p class=\"text-xl md:text-2xl font-medium italic leading-relaxed\" style=\"color: var(--color-brown-light);\">
                    \"Unite with Innovation, Aspire the Greater Generation\"
                </p>
            </div>

            <!-- Description -->
            <p class=\"text-lg md:text-xl max-w-2xl mx-auto mb-12 leading-relaxed\" style=\"color: rgba(107, 68, 35, 0.8);\">
                Celebrate cultural diversity with our unique teddy bear keychains wearing traditional outfits from around the world
            </p>

            <!-- CTA Button -->
            <button onclick=\"scrollToSection('products')\" class=\"inline-flex items-center px-8 py-4 text-white font-semibold rounded-full shadow-lg transition-all duration-300 transform hover:scale-105\" style=\"background-color: var(--color-gold);\">
                Explore Our Collection
                <svg class=\"ml-2 w-5 h-5\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\">
                    <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M19 9l-7 7-7-7\"></path>
                </svg>
            </button>

            <!-- Cultural Icons -->
            <div class=\"mt-16 flex justify-center items-center space-x-8 opacity-60\">
                <div class=\"text-4xl animate-bounce-slow\" style=\"animation-delay: 0s;\">🇵🇭</div>
                <div class=\"text-4xl animate-bounce-slow\" style=\"animation-delay: 0.2s;\">🇮🇳</div>
                <div class=\"text-4xl animate-bounce-slow\" style=\"animation-delay: 0.4s;\">🇳🇵</div>
            </div>
        </div>
    </section>

    <!-- Products Section -->
    <section id=\"products\" class=\"py-20 bg-gradient-to-b from-white\" style=\"--tw-gradient-to: var(--color-cream);\">
        <div class=\"max-w-7xl mx-auto px-4 sm:px-6 lg:px-8\">
            <!-- Section Header -->
            <div class=\"text-center mb-16\">
                <h2 class=\"text-5xl md:text-6xl font-bold mb-4\" style=\"color: var(--color-brown);\">
                    Our Products
                </h2>
                <div class=\"w-24 h-1 mx-auto mb-6\" style=\"background-color: var(--color-gold);\"></div>
                <p class=\"text-xl max-w-2xl mx-auto\" style=\"color: rgba(107, 68, 35, 0.7);\">
                    Handcrafted teddy bear keychains celebrating cultural diversity
                </p>
            </div>

            <!-- Male Bears -->
            <div class=\"mb-16\">
                <h3 class=\"text-3xl font-bold mb-8 text-center\" style=\"color: var(--color-brown);\">Male Bears</h3>
                <div class=\"grid grid-cols-1 md:grid-cols-3 gap-8\" id=\"male-products\"></div>
            </div>

            <!-- Female Bears -->
            <div>
                <h3 class=\"text-3xl font-bold mb-8 text-center\" style=\"color: var(--color-brown);\">Female Bears</h3>
                <div class=\"grid grid-cols-1 md:grid-cols-3 gap-8\" id=\"female-products\"></div>
            </div>
        </div>
    </section>

    <!-- Mission Section -->
    <section id=\"mission\" class=\"py-20 bg-white\">
        <div class=\"max-w-7xl mx-auto px-4 sm:px-6 lg:px-8\">
            <div class=\"text-center mb-16\">
                <h2 class=\"text-5xl md:text-6xl font-bold mb-4\" style=\"color: var(--color-brown);\">Our Mission</h2>
                <div class=\"w-24 h-1 mx-auto\" style=\"background-color: var(--color-gold);\"></div>
            </div>

            <div class=\"grid md:grid-cols-2 gap-12 items-center mb-20\">
                <div class=\"relative\">
                    <div class=\"absolute inset-0 rounded-3xl blur-3xl\" style=\"background-color: rgba(212, 175, 55, 0.2);\"></div>
                    <div class=\"relative rounded-2xl p-12 shadow-xl\" style=\"background: linear-gradient(to bottom right, var(--color-cream), var(--color-beige));\">
                        <div class=\"space-y-6\">
                            <div class=\"flex items-center space-x-4\">
                                <div class=\"w-16 h-16 rounded-full flex items-center justify-center flex-shrink-0\" style=\"background-color: var(--color-gold);\">
                                    <svg class=\"w-8 h-8 text-white\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\">
                                        <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z\"></path>
                                    </svg>
                                </div>
                                <h3 class=\"text-2xl font-bold\" style=\"color: var(--color-brown);\">Cultural Celebration</h3>
                            </div>
                            <div class=\"flex items-center space-x-4\">
                                <div class=\"w-16 h-16 rounded-full flex items-center justify-center flex-shrink-0\" style=\"background-color: var(--color-gold);\">
                                    <svg class=\"w-8 h-8 text-white\" fill=\"currentColor\" viewBox=\"0 0 20 20\">
                                        <path fill-rule=\"evenodd\" d=\"M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z\" clip-rule=\"evenodd\"></path>
                                    </svg>
                                </div>
                                <h3 class=\"text-2xl font-bold\" style=\"color: var(--color-brown);\">Promoting Pride</h3>
                            </div>
                            <div class=\"flex items-center space-x-4\">
                                <div class=\"w-16 h-16 rounded-full flex items-center justify-center flex-shrink-0\" style=\"background-color: var(--color-gold);\">
                                    <svg class=\"w-8 h-8 text-white\" fill=\"currentColor\" viewBox=\"0 0 20 20\">
                                        <path d=\"M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z\"></path>
                                    </svg>
                                </div>
                                <h3 class=\"text-2xl font-bold\" style=\"color: var(--color-brown);\">Fighting Discrimination</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div class=\"space-y-6\">
                    <div class=\"rounded-2xl p-8 border-l-4\" style=\"background-color: var(--color-cream); border-color: var(--color-gold);\">
                        <h3 class=\"text-2xl font-bold mb-4\" style=\"color: var(--color-brown);\">What is our mission?</h3>
                        <p class=\"leading-relaxed text-lg mb-6\" style=\"color: rgba(107, 68, 35, 0.8);\">
                            Bearitage is dedicated to celebrating and promoting the vibrant cultural heritage of Hong Kong's ethnic diverse individuals while fostering a strong sense of pride within communities that often face discrimination.
                        </p>
                        <p class=\"leading-relaxed text-lg font-semibold\" style=\"color: rgba(107, 68, 35, 0.8);\">
                            To further our commitment to this cause, we are excited to collaborate with the Zubin Foundation and will donate a portion of our profits to support their impactful work!
                        </p>
                    </div>

                    <div class=\"bg-white rounded-2xl p-8 shadow-lg border\" style=\"border-color: rgba(212, 175, 55, 0.2);\">
                        <h3 class=\"text-2xl font-bold mb-4\" style=\"color: var(--color-brown);\">Introducing our product</h3>
                        <p class=\"leading-relaxed mb-4\" style=\"color: rgba(107, 68, 35, 0.8);\">
                            We offer teddy bear keychains uniquely designed to represent the ethnic diverse individuals in Hong Kong. These designs showcase the traditional outfits of ethnic diverse individuals that are often used during special occasions, events and everyday life!
                        </p>
                        <div class=\"rounded-lg p-4\" style=\"background-color: rgba(212, 175, 55, 0.1);\">
                            <p class=\"leading-relaxed font-medium\" style=\"color: rgba(107, 68, 35, 0.8);\">
                                Celebrating the cultural heritage of Hong Kong's ethnic diverse individuals is important for promoting inclusivity and a sense of pride. It helps combat discrimination and highlights the valuable contributions these communities make to Hong Kong.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Zubin Foundation -->
            <div class=\"rounded-3xl p-12 shadow-xl\" style=\"background: linear-gradient(to bottom right, var(--color-cream), var(--color-beige));\">
                <div class=\"max-w-4xl mx-auto text-center\">
                    <div class=\"mb-8\">
                        <div class=\"w-24 h-24 bg-white rounded-full mx-auto mb-6 flex items-center justify-center shadow-lg\">
                            <div class=\"text-4xl\">🎈</div>
                        </div>
                        <h3 class=\"text-4xl font-bold mb-4\" style=\"color: var(--color-brown);\">The Zubin Foundation</h3>
                    </div>
                    <p class=\"text-lg leading-relaxed mb-8\" style=\"color: rgba(107, 68, 35, 0.8);\">
                        An Integrated Service Provider for Hong Kong's Ethnically Diverse Communities with a mission to improve the lives of Hong Kong's ethnically diverse individuals by reducing suffering and providing opportunities.
                    </p>
                    <div class=\"inline-flex items-center space-x-3 bg-white px-6 py-3 rounded-full shadow-md\">
                        <svg class=\"w-6 h-6\" style=\"color: var(--color-gold);\" fill=\"currentColor\" viewBox=\"0 0 20 20\">
                            <path fill-rule=\"evenodd\" d=\"M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z\" clip-rule=\"evenodd\"></path>
                        </svg>
                        <span class=\"font-semibold\" style=\"color: var(--color-brown);\">Supporting Diversity Together</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Gallery Section -->
    <section id=\"gallery\" class=\"py-20 bg-gradient-to-b from-white\" style=\"--tw-gradient-from: var(--color-cream);\">
        <div class=\"max-w-7xl mx-auto px-4 sm:px-6 lg:px-8\">
            <div class=\"text-center mb-16\">
                <h2 class=\"text-5xl md:text-6xl font-bold mb-4\" style=\"color: var(--color-brown);\">Photo Gallery</h2>
                <div class=\"w-24 h-1 mx-auto mb-6\" style=\"background-color: var(--color-gold);\"></div>
                <p class=\"text-xl max-w-2xl mx-auto\" style=\"color: rgba(107, 68, 35, 0.7);\">
                    Explore our collection of cultural teddy bears
                </p>
            </div>

            <div class=\"grid grid-cols-1 md:grid-cols-2 gap-8\" id=\"gallery-grid\"></div>

            <div class=\"mt-12 text-center\">
                <div class=\"inline-block px-8 py-4 rounded-full\" style=\"background-color: var(--color-cream);\">
                    <p class=\"font-medium\" style=\"color: var(--color-brown);\">
                        Follow us on social media for more photos! 📸
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section id=\"testimonials\" class=\"py-20 bg-white\">
        <div class=\"max-w-7xl mx-auto px-4 sm:px-6 lg:px-8\">
            <div class=\"text-center mb-16\">
                <h2 class=\"text-5xl md:text-6xl font-bold mb-4\" style=\"color: var(--color-brown);\">Customer Testimonials</h2>
                <div class=\"w-24 h-1 mx-auto mb-6\" style=\"background-color: var(--color-gold);\"></div>
                <p class=\"text-xl max-w-2xl mx-auto\" style=\"color: rgba(107, 68, 35, 0.7);\">
                    Hear what our customers say about Bearitage
                </p>
            </div>

            <div class=\"grid grid-cols-1 md:grid-cols-2 gap-8\" id=\"testimonials-grid\"></div>

            <div class=\"mt-16 text-center\">
                <div class=\"text-white rounded-2xl p-8 shadow-xl max-w-3xl mx-auto\" style=\"background: linear-gradient(to right, var(--color-gold), #B8941F);\">
                    <h3 class=\"text-3xl font-bold mb-4\">Love Your Bearitage?</h3>
                    <p class=\"text-lg mb-6\">Share your experience with us and join our growing community!</p>
                    <a href=\"mailto:hello@bearitage.hk?subject=My Bearitage Testimonial\" class=\"inline-block bg-white font-semibold px-8 py-3 rounded-full transition-colors\" style=\"color: var(--color-gold);\">
                        Share Your Story
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id=\"contact\" class=\"py-20 bg-gradient-to-b\" style=\"background: linear-gradient(to bottom, var(--color-cream), var(--color-beige));\">
        <div class=\"max-w-7xl mx-auto px-4 sm:px-6 lg:px-8\">
            <div class=\"text-center mb-16\">
                <h2 class=\"text-5xl md:text-6xl font-bold mb-4\" style=\"color: var(--color-brown);\">Contact Us</h2>
                <div class=\"w-24 h-1 mx-auto mb-6\" style=\"background-color: var(--color-gold);\"></div>
                <p class=\"text-xl max-w-2xl mx-auto\" style=\"color: rgba(107, 68, 35, 0.7);\">
                    Get in touch with us for inquiries and orders
                </p>
            </div>

            <div class=\"grid md:grid-cols-2 gap-12\">
                <!-- Contact Info -->
                <div class=\"space-y-6\">
                    <div class=\"bg-white rounded-2xl p-6 shadow-lg transition-all duration-300 transform hover:-translate-y-1\">
                        <div class=\"flex items-start space-x-4\">
                            <div class=\"w-12 h-12 rounded-full flex items-center justify-center flex-shrink-0\" style=\"background-color: var(--color-gold);\">
                                <svg class=\"w-6 h-6 text-white\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\">
                                    <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z\"></path>
                                    <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M15 11a3 3 0 11-6 0 3 3 0 016 0z\"></path>
                                </svg>
                            </div>
                            <div>
                                <h3 class=\"text-xl font-bold mb-2\" style=\"color: var(--color-brown);\">Address</h3>
                                <p class=\"leading-relaxed\" style=\"color: rgba(107, 68, 35, 0.7);\">
                                    Room 1508, 15/F, Tower B, Billion Centre, 1 Wang Kwong Road, Kowloon Bay, Hong Kong
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class=\"bg-white rounded-2xl p-6 shadow-lg transition-all duration-300 transform hover:-translate-y-1\">
                        <div class=\"flex items-start space-x-4\">
                            <div class=\"w-12 h-12 rounded-full flex items-center justify-center flex-shrink-0\" style=\"background-color: var(--color-gold);\">
                                <svg class=\"w-6 h-6 text-white\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\">
                                    <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z\"></path>
                                </svg>
                            </div>
                            <div>
                                <h3 class=\"text-xl font-bold mb-2\" style=\"color: var(--color-brown);\">Email</h3>
                                <a href=\"mailto:hello@bearitage.hk\" class=\"text-lg transition-colors\" style=\"color: var(--color-gold);\">
                                    hello@bearitage.hk
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class=\"bg-white rounded-2xl p-6 shadow-lg transition-all duration-300 transform hover:-translate-y-1\">
                        <div class=\"flex items-start space-x-4\">
                            <div class=\"w-12 h-12 rounded-full flex items-center justify-center flex-shrink-0\" style=\"background-color: var(--color-gold);\">
                                <svg class=\"w-6 h-6 text-white\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\">
                                    <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z\"></path>
                                </svg>
                            </div>
                            <div>
                                <h3 class=\"text-xl font-bold mb-2\" style=\"color: var(--color-brown);\">Phone</h3>
                                <a href=\"tel:+85291234567\" class=\"text-lg transition-colors\" style=\"color: var(--color-gold);\">
                                    +852 9123 4567
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class=\"bg-white rounded-2xl p-6 shadow-lg\">
                        <h3 class=\"text-xl font-bold mb-4\" style=\"color: var(--color-brown);\">Follow Us</h3>
                        <div class=\"flex space-x-4\">
                            <a href=\"https://facebook.com/bearitage\" target=\"_blank\" class=\"w-12 h-12 rounded-full flex items-center justify-center transition-all duration-300 transform hover:scale-110\" style=\"background-color: var(--color-gold);\">
                                <svg class=\"w-6 h-6 text-white\" fill=\"currentColor\" viewBox=\"0 0 24 24\">
                                    <path d=\"M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z\"/>
                                </svg>
                            </a>
                            <a href=\"https://instagram.com/bearitage.hk\" target=\"_blank\" class=\"w-12 h-12 rounded-full flex items-center justify-center transition-all duration-300 transform hover:scale-110\" style=\"background-color: var(--color-gold);\">
                                <svg class=\"w-6 h-6 text-white\" fill=\"currentColor\" viewBox=\"0 0 24 24\">
                                    <path d=\"M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z\"/>
                                </svg>
                            </a>
                            <a href=\"https://wa.me/85291234567\" target=\"_blank\" class=\"w-12 h-12 rounded-full flex items-center justify-center transition-all duration-300 transform hover:scale-110\" style=\"background-color: var(--color-gold);\">
                                <svg class=\"w-6 h-6 text-white\" fill=\"currentColor\" viewBox=\"0 0 24 24\">
                                    <path d=\"M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z\"/>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Contact CTA -->
                <div class=\"bg-white rounded-2xl p-8 shadow-xl\">
                    <h3 class=\"text-3xl font-bold mb-6\" style=\"color: var(--color-brown);\">Make an Inquiry</h3>
                    
                    <div class=\"space-y-6 mb-8\">
                        <p class=\"leading-relaxed\" style=\"color: rgba(107, 68, 35, 0.8);\">
                            Interested in our cultural teddy bear keychains? We'd love to hear from you!
                        </p>
                        
                        <div class=\"rounded-lg p-6 border-l-4\" style=\"background-color: var(--color-cream); border-color: var(--color-gold);\">
                            <h4 class=\"font-bold mb-2\" style=\"color: var(--color-brown);\">Quick Inquiry Options:</h4>
                            <ul class=\"space-y-2\" style=\"color: rgba(107, 68, 35, 0.8);\">
                                <li>• WhatsApp: Instant messaging</li>
                                <li>• Email: Detailed inquiries</li>
                                <li>• Phone: Direct consultation</li>
                            </ul>
                        </div>
                    </div>

                    <div class=\"space-y-4\">
                        <a href=\"https://wa.me/85291234567\" target=\"_blank\" class=\"block w-full bg-[#25D366] hover:bg-[#20BA5A] text-white font-semibold py-4 rounded-lg transition-all duration-300 transform hover:scale-105 shadow-lg text-center\">
                            WhatsApp Us
                        </a>
                        <a href=\"mailto:hello@bearitage.hk?subject=Product Inquiry\" class=\"block w-full text-white font-semibold py-4 rounded-lg transition-all duration-300 transform hover:scale-105 shadow-lg text-center\" style=\"background-color: var(--color-gold);\">
                            Send Email
                        </a>
                        <a href=\"tel:+85291234567\" class=\"block w-full text-white font-semibold py-4 rounded-lg transition-all duration-300 transform hover:scale-105 shadow-lg text-center\" style=\"background-color: var(--color-brown);\">
                            Call Us
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class=\"text-white\" style=\"background-color: var(--color-brown);\">
        <div class=\"max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12\">
            <div class=\"grid grid-cols-1 md:grid-cols-3 gap-8 mb-8\">
                <div>
                    <h3 class=\"text-2xl font-bold mb-4\" style=\"color: var(--color-gold);\">Bearitage</h3>
                    <p class=\"mb-4 opacity-80\">Unite with Innovation, Aspire the Greater Generation</p>
                    <div class=\"flex items-center space-x-2 opacity-80\">
                        <span>Made with</span>
                        <svg class=\"w-5 h-5 fill-current\" style=\"color: var(--color-gold);\" viewBox=\"0 0 20 20\">
                            <path fill-rule=\"evenodd\" d=\"M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z\" clip-rule=\"evenodd\"></path>
                        </svg>
                        <span>in Hong Kong</span>
                    </div>
                </div>

                <div>
                    <h4 class=\"text-xl font-bold mb-4\" style=\"color: var(--color-gold);\">Quick Links</h4>
                    <ul class=\"space-y-2\">
                        <li><a href=\"#home\" onclick=\"scrollToSection('home')\" class=\"opacity-80 transition-colors\" style=\"color: inherit;\">Home</a></li>
                        <li><a href=\"#products\" onclick=\"scrollToSection('products')\" class=\"opacity-80 transition-colors\" style=\"color: inherit;\">Products</a></li>
                        <li><a href=\"#mission\" onclick=\"scrollToSection('mission')\" class=\"opacity-80 transition-colors\" style=\"color: inherit;\">Mission</a></li>
                        <li><a href=\"#gallery\" onclick=\"scrollToSection('gallery')\" class=\"opacity-80 transition-colors\" style=\"color: inherit;\">Gallery</a></li>
                        <li><a href=\"#testimonials\" onclick=\"scrollToSection('testimonials')\" class=\"opacity-80 transition-colors\" style=\"color: inherit;\">Testimonials</a></li>
                        <li><a href=\"#contact\" onclick=\"scrollToSection('contact')\" class=\"opacity-80 transition-colors\" style=\"color: inherit;\">Contact</a></li>
                    </ul>
                </div>

                <div>
                    <h4 class=\"text-xl font-bold mb-4\" style=\"color: var(--color-gold);\">Contact Info</h4>
                    <div class=\"space-y-3 opacity-80\">
                        <p class=\"text-sm\">Room 1508, 15/F, Tower B, Billion Centre, 1 Wang Kwong Road, Kowloon Bay, Hong Kong</p>
                        <p><a href=\"mailto:hello@bearitage.hk\" class=\"transition-colors\" style=\"color: inherit;\">hello@bearitage.hk</a></p>
                        <p><a href=\"tel:+85291234567\" class=\"transition-colors\" style=\"color: inherit;\">+852 9123 4567</a></p>
                    </div>
                </div>
            </div>

            <div class=\"border-t pt-8 text-center\" style=\"border-color: rgba(255, 255, 255, 0.2);\">
                <p class=\"opacity-60 mb-4\">© <span id=\"current-year\"></span> Bearitage. All rights reserved.</p>
                <button onclick=\"window.scrollTo({top: 0, behavior: 'smooth'})\" class=\"inline-block text-white font-semibold px-6 py-2 rounded-full transition-colors\" style=\"background-color: var(--color-gold);\">
                    Back to Top ↑
                </button>
            </div>
        </div>
    </footer>

    <!-- Product Modal -->
    <div id=\"product-modal\" class=\"modal\">
        <div class=\"modal-content\">
            <button onclick=\"closeModal()\" class=\"absolute top-4 right-4 z-10 w-10 h-10 bg-white rounded-full shadow-lg flex items-center justify-center transition-colors\" style=\"color: var(--color-brown);\">
                <svg class=\"w-6 h-6\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\">
                    <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M6 18L18 6M6 6l12 12\"></path>
                </svg>
            </button>
            <div id=\"modal-content\" class=\"grid md:grid-cols-2 gap-8 p-8\"></div>
        </div>
    </div>

    <!-- Gallery Modal -->
    <div id=\"gallery-modal\" class=\"modal\">
        <button onclick=\"closeGalleryModal()\" class=\"absolute top-4 right-4 w-10 h-10 bg-white rounded-full shadow-lg flex items-center justify-center z-50 transition-colors\" style=\"color: var(--color-brown);\">
            <svg class=\"w-6 h-6\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\">
                <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M6 18L18 6M6 6l12 12\"></path>
            </svg>
        </button>
        <div class=\"relative max-w-5xl mx-auto\">
            <img id=\"gallery-modal-image\" class=\"w-full h-auto rounded-2xl shadow-2xl\" />
            <div class=\"mt-4 text-center\">
                <p id=\"gallery-modal-caption\" class=\"text-white text-xl font-semibold\"></p>
            </div>
        </div>
    </div>

    <script>
        // Product Data
        const products = [
            {
                id: 1,
                name: \"Philippines Male Bear\",
                category: \"Male Bears\",
                country: \"Philippines\",
                outfit: \"Katipunero\",
                price: \"70 HKD\",
                image: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/gvzwtfdm_IMG_20260320_110821.jpg\",
                description: \"A charming teddy bear keychain wearing the traditional Katipunero uniform, representing Filipino revolutionary heritage.\",
                outfitDetails: \"The Katipunero was a uniform used during the revolutionary times with the Filipinos against the Spanish.\",
                culturalSignificance: \"This outfit represents the pride and identity of Filipino culture and revolutionary history.\"
            },
            {
                id: 2,
                name: \"India Male Bear\",
                category: \"Male Bears\",
                country: \"India\",
                outfit: \"Kurta\",
                price: \"70 HKD\",
                image: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/gvzwtfdm_IMG_20260320_110821.jpg\",
                description: \"An adorable teddy bear keychain dressed in traditional Indian Kurta, showcasing Indian cultural elegance.\",
                outfitDetails: \"A traditional garment from ancient India, worn on both casual and formal occasions.\",
                culturalSignificance: \"It represents the pride and identity of Indian culture, symbolizing grace and tradition.\"
            },
            {
                id: 3,
                name: \"Nepal Male Bear\",
                category: \"Male Bears\",
                country: \"Nepal\",
                outfit: \"Kurta with Gurkha Topi\",
                price: \"70 HKD\",
                image: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/gvzwtfdm_IMG_20260320_110821.jpg\",
                description: \"A delightful teddy bear keychain wearing traditional Nepali attire with the iconic Gurkha topi hat.\",
                outfitDetails: \"The Kurta is similar to the Indian style. The Nepali black hat is usually worn on special occasions like festivals and is compulsory in national institutions like the police.\",
                culturalSignificance: \"The Kultri (knife) is the iconic weapon of the Gurkhas (Nepali soldiers), representative of Nepal's culture and military heritage.\"
            },
            {
                id: 4,
                name: \"Philippines Female Bear\",
                category: \"Female Bears\",
                country: \"Philippines\",
                outfit: \"Baro't Saya\",
                price: \"70 HKD\",
                image: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/cbnbwcli_IMG-20260320-WA0007.jpg\",
                description: \"A beautiful teddy bear keychain adorned in the elegant Baro't Saya, the national dress of the Philippines.\",
                outfitDetails: \"A national clothing that blends the influence of both pre-colonial Philippines and Spanish influence.\",
                culturalSignificance: \"This traditional attire represents the rich cultural heritage and femininity of Filipino culture.\"
            },
            {
                id: 5,
                name: \"India Female Bear\",
                category: \"Female Bears\",
                country: \"India\",
                outfit: \"Saree\",
                price: \"70 HKD\",
                image: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/cbnbwcli_IMG-20260320-WA0007.jpg\",
                description: \"An elegant teddy bear keychain draped in a stunning red Saree, embodying Indian grace and tradition.\",
                outfitDetails: \"A Saree, typically worn in festivals, events, and gatherings, represents grace, femininity, and cultural heritage.\",
                culturalSignificance: \"Influenced by Persian culture, the Saree is a timeless symbol of Indian elegance and tradition.\"
            },
            {
                id: 6,
                name: \"Nepal Female Bear\",
                category: \"Female Bears\",
                country: \"Nepal\",
                outfit: \"Sari & Pote (Yellow Necklace)\",
                price: \"70 HKD\",
                image: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/cbnbwcli_IMG-20260320-WA0007.jpg\",
                description: \"A lovely teddy bear keychain wearing traditional Nepali Sari with the distinctive yellow Pote necklace.\",
                outfitDetails: \"Similar to other South Asian countries, the fusion of local practices and external influences.\",
                culturalSignificance: \"Worn during special occasions and has modernized over the years, representing Nepali cultural identity.\"
            }
        ];

        const testimonials = [
            {
                id: 1,
                name: \"Sarah Chen\",
                location: \"Hong Kong\",
                rating: 5,
                text: \"Absolutely love my Bearitage keychain! The quality and cultural details are amazing. It's a perfect gift that celebrates diversity.\",
                avatar: \"SC\"
            },
            {
                id: 2,
                name: \"Rajesh Kumar\",
                location: \"India\",
                rating: 5,
                text: \"The Indian Kurta bear is so well-made! It beautifully represents our culture. Great way to keep heritage close to heart.\",
                avatar: \"RK\"
            },
            {
                id: 3,
                name: \"Maria Santos\",
                location: \"Philippines\",
                rating: 5,
                text: \"The Baro't Saya bear brought tears to my eyes! Such attention to detail. Proud to carry a piece of my heritage everywhere.\",
                avatar: \"MS\"
            },
            {
                id: 4,
                name: \"Priya Sharma\",
                location: \"Hong Kong\",
                rating: 5,
                text: \"Bought the Saree bear as a gift and it was a hit! Beautiful craftsmanship and meaningful cultural representation.\",
                avatar: \"PS\"
            }
        ];

        const galleryImages = [
            {
                id: 1,
                url: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/h1vjpv7z_IMG-20260320-WA0003.jpg\",
                alt: \"Male Bears Collection\"
            },
            {
                id: 2,
                url: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/5s9h19a1_IMG-20260320-WA0005.jpg\",
                alt: \"Female Bears Collection\"
            },
            {
                id: 3,
                url: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/gvzwtfdm_IMG_20260320_110821.jpg\",
                alt: \"Cultural Bears Display\"
            },
            {
                id: 4,
                url: \"https://customer-assets.emergentagent.com/job_47b05bd4-2184-40a9-912d-c02c1e65c283/artifacts/cbnbwcli_IMG-20260320-WA0007.jpg\",
                alt: \"Bearitage Products\"
            }
        ];

        // Render Products
        function renderProducts() {
            const maleContainer = document.getElementById('male-products');
            const femaleContainer = document.getElementById('female-products');

            const maleProducts = products.filter(p => p.category === 'Male Bears');
            const femaleProducts = products.filter(p => p.category === 'Female Bears');

            maleProducts.forEach(product => {
                maleContainer.innerHTML += createProductCard(product);
            });

            femaleProducts.forEach(product => {
                femaleContainer.innerHTML += createProductCard(product);
            });
        }

        function createProductCard(product) {
            return `
                <div onclick=\"openModal(${product.id})\" class=\"group cursor-pointer\">
                    <div class=\"bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 overflow-hidden transform hover:-translate-y-2\">
                        <div class=\"relative aspect-square p-8 overflow-hidden\" style=\"background: linear-gradient(to bottom right, var(--color-cream), var(--color-beige));\">
                            <div class=\"absolute inset-0 bg-transparent group-hover:bg-[#D4AF37] group-hover:bg-opacity-10 transition-all duration-300\"></div>
                            <img src=\"${product.image}\" alt=\"${product.name}\" class=\"w-full h-full object-contain relative z-10 transform group-hover:scale-110 transition-transform duration-500\" />
                        </div>
                        <div class=\"p-6\">
                            <div class=\"flex items-center justify-between mb-2\">
                                <span class=\"text-sm font-semibold px-3 py-1 rounded-full\" style=\"color: var(--color-gold); background-color: rgba(212, 175, 55, 0.1);\">
                                    ${product.country}
                                </span>
                                <span class=\"text-2xl font-bold\" style=\"color: var(--color-brown);\">${product.price}</span>
                            </div>
                            <h4 class=\"text-xl font-bold mb-2 group-hover:text-[#D4AF37] transition-colors\" style=\"color: var(--color-brown);\">
                                ${product.outfit}
                            </h4>
                            <p class=\"text-sm line-clamp-2 mb-4\" style=\"color: rgba(107, 68, 35, 0.7);\">
                                ${product.description}
                            </p>
                            <button class=\"w-full py-3 rounded-lg font-semibold transition-all duration-300 group-hover:text-white\" style=\"background-color: var(--color-cream); color: var(--color-brown);\">
                                View Details
                            </button>
                        </div>
                    </div>
                </div>
            `;
        }

        // Render Testimonials
        function renderTestimonials() {
            const container = document.getElementById('testimonials-grid');
            testimonials.forEach(testimonial => {
                const stars = '⭐'.repeat(testimonial.rating);
                container.innerHTML += `
                    <div class=\"rounded-2xl p-8 shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-2\" style=\"background: linear-gradient(to bottom right, var(--color-cream), var(--color-beige));\">
                        <div class=\"flex items-center space-x-1 mb-4 text-xl\">${stars}</div>
                        <p class=\"text-lg leading-relaxed mb-6 italic\" style=\"color: rgba(107, 68, 35, 0.8);\">
                            \"${testimonial.text}\"
                        </p>
                        <div class=\"flex items-center space-x-4\">
                            <div class=\"w-12 h-12 rounded-full flex items-center justify-center text-white font-bold text-lg flex-shrink-0\" style=\"background-color: var(--color-gold);\">
                                ${testimonial.avatar}
                            </div>
                            <div>
                                <p class=\"font-bold\" style=\"color: var(--color-brown);\">${testimonial.name}</p>
                                <p class=\"text-sm\" style=\"color: rgba(107, 68, 35, 0.6);\">${testimonial.location}</p>
                            </div>
                        </div>
                    </div>
                `;
            });
        }

        // Render Gallery
        function renderGallery() {
            const container = document.getElementById('gallery-grid');
            galleryImages.forEach(image => {
                container.innerHTML += `
                    <div onclick=\"openGalleryModal('${image.url}', '${image.alt}')\" class=\"group cursor-pointer relative overflow-hidden rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2\">
                        <div class=\"aspect-video\" style=\"background: linear-gradient(to bottom right, var(--color-cream), var(--color-beige));\">
                            <img src=\"${image.url}\" alt=\"${image.alt}\" class=\"w-full h-full object-cover group-hover:scale-110 transition-transform duration-500\" />
                        </div>
                        <div class=\"absolute inset-0 bg-gradient-to-t from-black/60 via-black/0 to-black/0 opacity-0 group-hover:opacity-100 transition-opacity duration-300\">
                            <div class=\"absolute bottom-0 left-0 right-0 p-6\">
                                <p class=\"text-white font-semibold text-lg\">${image.alt}</p>
                            </div>
                        </div>
                    </div>
                `;
            });
        }

        // Modal Functions
        function openModal(productId) {
            const product = products.find(p => p.id === productId);
            const modal = document.getElementById('product-modal');
            const content = document.getElementById('modal-content');
            
            content.innerHTML = `
                <div class=\"space-y-4\">
                    <div class=\"relative aspect-square rounded-xl overflow-hidden p-8\" style=\"background: linear-gradient(to bottom right, var(--color-cream), var(--color-beige));\">
                        <img src=\"${product.image}\" alt=\"${product.name}\" class=\"w-full h-full object-contain rounded-lg\" />
                    </div>
                    <div class=\"text-center py-3 rounded-lg text-white\" style=\"background-color: var(--color-gold);\">
                        <p class=\"text-3xl font-bold\">${product.price}</p>
                    </div>
                </div>
                <div class=\"space-y-6\">
                    <div class=\"inline-block px-4 py-2 rounded-full text-sm font-semibold\" style=\"background-color: var(--color-beige); color: var(--color-brown);\">
                        ${product.country}
                    </div>
                    <div>
                        <h2 class=\"text-4xl font-bold mb-2\" style=\"color: var(--color-brown);\">${product.name}</h2>
                        <p class=\"text-xl font-semibold\" style=\"color: var(--color-gold);\">${product.outfit}</p>
                    </div>
                    <div class=\"border-l-4 pl-4\" style=\"border-color: var(--color-gold);\">
                        <p class=\"leading-relaxed\" style=\"color: rgba(107, 68, 35, 0.8);\">${product.description}</p>
                    </div>
                    <div class=\"rounded-lg p-6 space-y-4\" style=\"background-color: var(--color-cream);\">
                        <div>
                            <h3 class=\"text-lg font-bold mb-2\" style=\"color: var(--color-brown);\">Outfit Details</h3>
                            <p class=\"text-sm leading-relaxed\" style=\"color: rgba(107, 68, 35, 0.8);\">${product.outfitDetails}</p>
                        </div>
                        <div>
                            <h3 class=\"text-lg font-bold mb-2\" style=\"color: var(--color-brown);\">Cultural Significance</h3>
                            <p class=\"text-sm leading-relaxed\" style=\"color: rgba(107, 68, 35, 0.8);\">${product.culturalSignificance}</p>
                        </div>
                    </div>
                    <div class=\"space-y-3 pt-4\">
                        <a href=\"https://wa.me/85291234567?text=Hi, I'm interested in ${product.name}\" target=\"_blank\" class=\"w-full bg-[#25D366] hover:bg-[#20BA5A] text-white font-semibold py-4 rounded-lg transition-all duration-300 transform hover:scale-105 shadow-lg flex items-center justify-center space-x-2\">
                            <span>📱</span>
                            <span>WhatsApp Inquiry</span>
                        </a>
                        <a href=\"mailto:hello@bearitage.hk?subject=Inquiry about ${product.name}\" class=\"w-full text-white font-semibold py-4 rounded-lg transition-all duration-300 transform hover:scale-105 shadow-lg flex items-center justify-center space-x-2\" style=\"background-color: var(--color-brown);\">
                            <span>✉️</span>
                            <span>Email Inquiry</span>
                        </a>
                    </div>
                </div>
            `;
            
            modal.classList.add('active');
            document.body.classList.add('modal-open');
        }

        function closeModal() {
            const modal = document.getElementById('product-modal');
            modal.classList.remove('active');
            document.body.classList.remove('modal-open');
        }

        function openGalleryModal(url, caption) {
            const modal = document.getElementById('gallery-modal');
            const image = document.getElementById('gallery-modal-image');
            const captionEl = document.getElementById('gallery-modal-caption');
            
            image.src = url;
            captionEl.textContent = caption;
            
            modal.classList.add('active');
            document.body.classList.add('modal-open');
        }

        function closeGalleryModal() {
            const modal = document.getElementById('gallery-modal');
            modal.classList.remove('active');
            document.body.classList.remove('modal-open');
        }

        // Scroll Functions
        function scrollToSection(sectionId) {
            const element = document.getElementById(sectionId);
            if (element) {
                element.scrollIntoView({ behavior: 'smooth', block: 'start' });
                // Close mobile menu if open
                document.getElementById('mobile-menu').classList.remove('active');
            }
        }

        // Navbar Scroll Effect
        window.addEventListener('scroll', () => {
            const navbar = document.getElementById('navbar');
            if (window.scrollY > 50) {
                navbar.style.backgroundColor = 'rgba(250, 243, 224, 0.95)';
                navbar.style.backdropFilter = 'blur(10px)';
                navbar.style.boxShadow = '0 4px 6px -1px rgba(0, 0, 0, 0.1)';
            } else {
                navbar.style.backgroundColor = 'transparent';
                navbar.style.backdropFilter = 'none';
                navbar.style.boxShadow = 'none';
            }
        });

        // Mobile Menu Toggle
        document.getElementById('mobile-menu-btn').addEventListener('click', () => {
            document.getElementById('mobile-menu').classList.toggle('active');
        });

        // Close modal on backdrop click
        document.getElementById('product-modal').addEventListener('click', (e) => {
            if (e.target.id === 'product-modal') {
                closeModal();
            }
        });

        document.getElementById('gallery-modal').addEventListener('click', (e) => {
            if (e.target.id === 'gallery-modal') {
                closeGalleryModal();
            }
        });

        // Initialize
        document.addEventListener('DOMContentLoaded', () => {
            renderProducts();
            renderTestimonials();
            renderGallery();
            document.getElementById('current-year').textContent = new Date().getFullYear();
        });
    </script>
</body>
</html>
"
Observation: Create successful: /app/bearitage-website.html
