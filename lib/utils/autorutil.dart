class Autor {
  final String nombre;
  final String fotoUrl;
  final String email;
  final String telefono;
  final String github;

  Autor({
    required this.nombre,
    required this.fotoUrl,
    required this.email,
    required this.telefono,
    required this.github,
  });
}

final Autor autor = Autor(
    nombre: 'Elias Mariñez',
    fotoUrl: 'assets/images/profile.jpg',
    email: 'eliasperez470@gmail.com',
    telefono: '+1 829-704-4337',
    github: 'github.com/elias-marinez',
  );