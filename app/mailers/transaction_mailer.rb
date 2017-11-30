class TransactionMailer < ApplicationMailer
require 'mailgun'

  def send_transaction
    RestClient.post "https://api:key-2063760afe2bb03efc1f0e9f0132276a"\
     "@api.mailgun.net/v3/DevSiteAlpha/messages",
     :from => "DevSiteAlpha <postmaster@sandbox5692993916974fa4a68e92cdf03782c9.mailgun.org>",
     :to => "#{$customer.email}",
     :subject => "Transaction Complete!",
     :text => "
     Transaction Complete!
     ---------------------

     You have successfully purchased <%= @game.title %>!

     We hope that you enjoy it!

     Your purchase total is <%= @game.price %>

     Thank you for your purchase, have a great day!
     ",
     :html => '
     <h1>Transaction Complete!</h1>
     <p>
       You have successfully purchased <%= @game.title %>!
       <br />
       We hope you enjoy it!
     </p>
     <p>
       Your purchase total is <%= @game.price %>
     </p>
     <p>Thank you for your purchase, have a great day!</p>
     '
end
