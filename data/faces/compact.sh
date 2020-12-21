#! /bin/bash

csvcut -c "WorkerId,WorkTimeInSeconds,Input.img,Answer.category.label" output.csv | \
    sed -E 's/m_[0-9]+_m_[mf]_a_[ab]\.jpg/TRUE,Anger/' | \
    sed -E 's/m_[0-9]+_m_[mf]_d_[ab]\.jpg/TRUE,Disgust/g' | \
    sed -E 's/m_[0-9]+_m_[mf]_f_[ab]\.jpg/TRUE,Fear/g' | \
    sed -E 's/m_[0-9]+_m_[mf]_n_[ab]\.jpg/TRUE,Neutral/g' | \
    sed -E 's/m_[0-9]+_m_[mf]_s_[ab]\.jpg/TRUE,Sadness/g' | \
    sed -E 's/m_[0-9]+_m_[mf]_h_[ab]\.jpg/TRUE,Happiness/g' | \
    sed -E 's/[0-9]+_m_[mf]_a_[ab]\.jpg/FALSE,Anger/' | \
    sed -E 's/[0-9]+_m_[mf]_d_[ab]\.jpg/FALSE,Disgust/g' | \
    sed -E 's/[0-9]+_m_[mf]_f_[ab]\.jpg/FALSE,Fear/g' | \
    sed -E 's/[0-9]+_m_[mf]_n_[ab]\.jpg/FALSE,Neutral/g' | \
    sed -E 's/[0-9]+_m_[mf]_s_[ab]\.jpg/FALSE,Sadness/g' | \
    sed -E 's/[0-9]+_m_[mf]_h_[ab]\.jpg/FALSE,Happiness/g' | \
    sed 's/Emotion neutral/Neutral/g' | \
    sed 's/WorkerId,WorkTimeInSeconds,Input.img,Answer.category.label/Worker,Time,Mask,Real,Detected/g'
