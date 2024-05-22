const express = require('express');
const nodemailer = require('nodemailer');

const app = express();
app.use(express.json());

app.post('/send-email', (req, res) => {
  const { name, email, message } = req.body;

  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'wraisework@gmail.com', // replace with your email
      pass: 'worktest@123', // replace with your email password
    },
  });

  const mailOptions = {
    from: email,
    to: 'wraisework@gmail.com',
    subject: `Contact from ${name}`,
    text: `Name: ${name}\nEmail: ${email}\n\n${message}`,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      return res.status(500).send('Error sending email: ' + error.toString());
    }
    res.send('Email sent: ' + info.response);
  });
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});
