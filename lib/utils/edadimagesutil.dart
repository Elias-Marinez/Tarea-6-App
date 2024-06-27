class EdadImagesUtil {
  static String getImageUrl(String ageCategory, String gender) {
    if (ageCategory == 'Joven') {
      return gender == 'female'
          ? 'https://img.freepik.com/vector-premium/mujer-hermosa-hipster-ropa-elegante-ilustraciones-dibujos-animados-aisladas-sobre-fondo-blanco-feliz-chica-adolescente-pelirroja-rizada-vestido_126520-261.jpg'
          : 'https://img.freepik.com/vector-premium/icono-hombre-joven-dibujos-animados_24908-23709.jpg';
    } else if (ageCategory == 'Adulto') {
      return gender == 'female'
          ? 'https://static.vecteezy.com/system/resources/previews/019/155/008/non_2x/young-woman-pointing-to-search-bar-cartoon-happy-lady-browsing-online-business-interface-of-searching-flat-illustration-isolated-on-white-background-vector.jpg'
          : 'https://static.vecteezy.com/system/resources/previews/008/573/008/non_2x/young-man-reading-a-interesting-book-with-magnifying-glass-cartoon-character-flat-illustration-isolated-on-white-background-free-vector.jpg';
    } else if (ageCategory == 'Anciano') {
      return gender == 'female'
          ? 'https://img.freepik.com/vector-premium/anciana-dibujos-animados-baston_29190-4601.jpg'
          : 'https://img.freepik.com/vector-gratis/ilustracion-dibujos-animados-anciano-dibujado-mano_52683-117765.jpg';
    }
    return 'https://img.freepik.com/foto-gratis/resumen-superficie-texturas-muro-piedra-hormigon-blanco_74190-8189.jpg';
  }
}