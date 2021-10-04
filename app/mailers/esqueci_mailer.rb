class EsqueciMailer < ApplicationMailer

    def mandarCodigo(email, codigo)
        @codigo = codigo
        mail(to: email, subject: "Recuperar senha - Colmeia")

    end
end
