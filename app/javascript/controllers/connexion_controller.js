import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="connexion"
export default class extends Controller {
  static targets = [
    "gotousersignin",
    "flashNoticeadmin",
    "gotoadminsignin",
    "flashNoticeuser",
    "closeBtnform",
    "formPopup",
    "loginBtn",
    "closeBtnHeader",
    "navbar",
    "loginAsParticipant",
    "loginAsAdmin",
    "formParticipant",
    "formAdmin"
  ]
  connect() {
    console.log("Hello, Stimulus!")
  }
  
  showPopup() {
    this.formPopupTarget.style.display = "block";
  }

  showLoginAsAdministrator() {
    this.toggleLoginAsParticipant();
    this.toggleLoginAsAdministrator();
  }

  toggleLoginAsAdministrator() {
    this.loginAsAdminTarget.classList.toggle("flex");
    this.loginAsAdminTarget.classList.toggle("hidden");
  }

  showLoginAsParticipant() {
    this.toggleLoginAsAdministrator();
    this.toggleLoginAsParticipant();
  }

  toggleLoginAsParticipant() {
    this.loginAsParticipantTarget.classList.toggle("flex");
    this.loginAsParticipantTarget.classList.toggle("hidden");
  }

  submitParticipant(e){
    this.formParticipantTarget.submit();
    e.preventDefault();
  }

  submitAdmin(e){
    this.formAdminTarget.submit();
    e.preventDefault();
  }

}
