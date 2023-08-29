import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        // console.log(data)
        // const senderId = data.sender_id;
        // const messageId = data.message_id;
        // console.log(data.content)
        messagesContainer.insertAdjacentHTML('beforeend', data.content);
        // if (senderId == current_user) {
        // const mess = document.getElementById('message-${messageId}')
        // mess.classList.add("chat-bubble-user")
        // } else {
        // mess.classList.add("chat-bubble")
        // }
      },
    });
  }
}

export { initChatroomCable };
// ##  ajouter dataset id du current_user
// # recup l'id dans le JS
// ## passer le sender id dans les datas
// ## dans le js si le sender id est diff du current_uder ajouter la class
