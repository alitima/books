abstract final class SearchPageConstants {
  static const fieldHint = 'Введите название книги...';
  static const fieldEmptyText = 'Поле не может быть пустым';
  static const fieldMustStartWithUpperCaseLetter =
      'Текст должен начинаться с заглавной буквы';
  static const buttonText = 'Поиск';
}

abstract final class ResultPageConstants {
  static const error = 'Произошла ошибка!';
}

abstract final class BookInfoPageConstants {
  static const name = 'Название книги';
  static const author = 'Автор книги';
  static const genre = 'Жанр';
  static const language = 'Язык';
  static const publicationYear = 'Год издания';
  static const all = [name, author, genre, language, publicationYear];
}
