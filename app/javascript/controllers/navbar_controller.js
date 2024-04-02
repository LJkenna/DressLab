import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    window.addEventListener('scroll', this.handleScroll.bind(this));
  }

  disconnect() {
    window.removeEventListener('scroll', this.handleScroll.bind(this));
  }

  handleScroll() {
    const navbar = this.element;
    if (window.pageYOffset > 0) {
      navbar.classList.add('navbar-shrink');
    } else {
      navbar.classList.remove('navbar-shrink');
    }
  }
}