

bcrypt = require 'bcrypt'

api = {}





api.registerGo = ({ payload, spark }) ->
    { email, pwd } = payload



    hornet_id = v4()



    bcrypt.genSalt 10, (err, salt) ->
        if err
            c "#{color.red('handle err', on)}"
        else
            c 'salt', salt
            bcrypt.hash pwd, salt, (err2, hash) ->
                if err2
                    c "#{color.red('handle error', on)}"
                else
                    redis.hmsetAsync 'hornet_id',
                        hornet_id: hornet_id
                        email: email
                        hash: hash
                    .then (re2) ->
                        spark.write
                            type: 'res_registerGo'
                            payload:
                                status: 'okGood'
                                clientToken: 'placeholder'




    redis.hsetAsync 'hornets_emails', email, hornet_id
    .then (re0) ->
        c "#{color.blue('re0', on)} #{color.purple(re0, on)}"




respond_check_avail = ({ status, spark }) ->
    spark.write
        type: 'res_register_check_avail'
        payload: { status }


api.register_check_avail = ({ payload, spark }) ->
    { candide } = payload
    redis.hgetAsync 'hornets_emails', candide
    .then (re) ->
        if re is null
            respond_check_avail { spark, status: 'okGood' }
        else
            respond_check_avail { spark, status: 'noTaken' }












exports.default = api
