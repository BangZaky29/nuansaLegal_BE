const db = require('./src/config/database');

const faqData = [
  {
    question: "Apa saja persyaratan nama perseroan (PT/CV/Yayasan/Koperasi/Perkumpulan)?",
    answer: "Untuk PT, minimal terdiri dari 3 kata (contoh: PT Nuansa Berkah Sejahtera). Untuk CV, minimal 2 kata namun disarankan 3 kata. Untuk Yayasan, minimal 3 atau 4 kata. Untuk Perkumpulan, minimal 3 kata atau lebih. Nama tidak boleh mengandung unsur SARA atau melanggar norma kesusilaan.",
    category: "Legalitas",
    sub_category: "Pendirian Legalitas"
  },
  {
    question: "Apa syarat pendirian PT Umum (PMDN)?",
    answer: "1) Minimal 2 orang pengurus (Direktur dan Komisaris). 2) Memiliki KTP dan NPWP aktif. 3) Mengisi formulir pendirian dari PT Nuansa Berkah Sejahtera. Estimasi proses adalah 3-7 hari kerja setelah penandatanganan minuta Akta.",
    category: "Legalitas",
    sub_category: "Pendirian Legalitas"
  },
  {
    question: "Bagaimana dengan syarat pendirian PT Perorangan?",
    answer: "1) Hanya memerlukan 1 orang pengurus (Direktur). 2) Memiliki KTP dan NPWP aktif. 3) Mengisi formulir pendirian. Keuntungan: Dapat membuka rekening perusahaan dan membuat Akta Penegasan. Namun, tidak dapat memproses SBUJK (Konstruksi). Estimasi proses hanya 1 hari kerja.",
    category: "Legalitas",
    sub_category: "Pendirian Legalitas"
  },
  {
    question: "Apa syarat pendirian CV (Persero Komanditer)?",
    answer: "1) Minimal 2 orang pengurus (Direktur dan Komisaris). 2) Memiliki KTP dan NPWP aktif. 3) Mengisi formulir pendirian. Estimasi proses adalah 3-7 hari kerja setelah penandatanganan minuta Akta.",
    category: "Legalitas",
    sub_category: "Pendirian Legalitas"
  },
  {
    question: "Apa syarat pendirian PT PMA (Penanaman Modal Asing)?",
    answer: "1) Minimal 2 orang pengurus. 2) Dokumen identitas (Paspor untuk WNA, KTP & NPWP untuk WNI). 3) Mengisi formulir pendirian. Modal dasar minimal Rp 10,5 Miliar. Kami juga melayani pengurusan KITAS untuk investor asing. Estimasi proses 7-14 hari kerja.",
    category: "Legalitas",
    sub_category: "Pendirian Legalitas"
  },
  {
    question: "Apa syarat pendirian Yayasan?",
    answer: "1) Minimal 5 orang pengurus (Pembina, Pengurus, Sekretaris, Bendahara, dan Pengawas). 2) KTP dan NPWP pengurus. 3) Modal dasar minimal Rp 10 Juta. Estimasi proses 7-21 hari kerja, tergantung pada persetujuan nama oleh Kemenkumham.",
    category: "Legalitas",
    sub_category: "Pendirian Legalitas"
  },
  {
    question: "Apa syarat pendirian Koperasi?",
    answer: "1) Minimal 9 orang anggota/pengurus. 2) KTP dan NPWP. 3) Mengisi formulir pendirian. Untuk Koperasi Produsen/Konsumen tidak ada modal minimal. Untuk Koperasi Simpan Pinjam (KSP), modal minimal mulai dari Rp 500 Juta (Skala Kota) hingga Rp 5 Miliar (Skala Nasional). Estimasi proses 7-21 hari kerja.",
    category: "Legalitas",
    sub_category: "Pendirian Legalitas"
  },
  {
    question: "Apa syarat pendirian Perkumpulan?",
    answer: "1) Minimal 5 orang pengurus. 2) KTP dan NPWP. 3) Modal dasar minimal Rp 10 Juta. Estimasi proses 14-30 hari kerja, tergantung pada persetujuan nama oleh Kemenkumham.",
    category: "Legalitas",
    sub_category: "Pendirian Legalitas"
  },
  {
    question: "Apa syarat pendirian Firma?",
    answer: "1) Minimal 2 orang pengurus (Managing Partner dan Anggota). 2) KTP dan NPWP. 3) Memiliki Surat Keterangan Profesi (seperti Advokat, Akuntan, atau Arsitek). Estimasi proses 3-7 hari kerja.",
    category: "Legalitas",
    sub_category: "Pendirian Legalitas"
  },
  {
    question: "Apakah PT Perorangan dapat memiliki Akta Notaris?",
    answer: "Ya, PT Perorangan dapat membuat Akta Penegasan di Notaris. Proses ini dapat dilakukan setelah legalitas dasar (NIB, NPWP PT, dll) terbit. Estimasi proses 1-3 hari kerja.",
    category: "Legalitas",
    sub_category: "Pembuatan Legalitas"
  },
  {
    question: "Apakah PT Perorangan dapat membuka Rekening Perusahaan?",
    answer: "Tentu saja. PT Perorangan memiliki legalitas yang sah untuk membuka rekening bank atas nama perusahaan. Kami dapat membantu mempercepat proses pembukaan rekening di area Jabodetabek.",
    category: "Legalitas",
    sub_category: "Pembuatan Legalitas"
  },
  {
    question: "Apakah PT Nuansa Berkah Sejahtera melayani pengurusan Izin Konstruksi (SBUJK)?",
    answer: "Ya, kami melayani pengurusan SBUJK secara lengkap, mulai dari pemberkasan, pengadaan tenaga ahli (PJT/PJSK), hingga penerbitan KTA Asosiasi. Biaya mulai dari Rp 2.000.000,-.",
    category: "Legalitas",
    sub_category: "Pembuatan Legalitas"
  },
  {
    question: "Apakah melayani pengurusan Izin Edar PIRT?",
    answer: "Ya, kami membantu proses pemberkasan, pemilihan KBLI, hingga desain kemasan sesuai standar Dinkes. Biaya mulai dari Rp 600.000,-. Cocok untuk produk makanan kering, sambal, atau minuman serbuk.",
    category: "Legalitas",
    sub_category: "Pembuatan Legalitas"
  },
  {
    question: "Apakah melayani pengurusan BPOM (MD, ML, TR, NA)?",
    answer: "Kami melayani pengurusan izin BPOM lengkap termasuk audit CPPOB/CPPKB. Biaya mulai dari Rp 12.000.000,-. Silakan hubungi admin kami di 089644448721 untuk konsultasi lebih lanjut.",
    category: "Legalitas",
    sub_category: "Pembuatan Legalitas"
  },
  {
    question: "Apakah melayani pengurusan Izin Edar PKRT (Perbekalan Kesehatan Rumah Tangga)?",
    answer: "Ya, kami melayani pendaftaran merek, uji lab, hingga penerbitan sertifikat PKRT untuk produk seperti tisu, sabun cuci piring, atau alat kesehatan lainnya. Biaya mulai dari Rp 6.000.000,-.",
    category: "Legalitas",
    sub_category: "Pembuatan Legalitas"
  }
];

async function seed() {
  try {
    console.log('Seeding FAQs...');
    
    // Clear existing FAQs
    await db.query('DELETE FROM faqs');
    
    for (let i = 0; i < faqData.length; i++) {
      const { question, answer, category, sub_category } = faqData[i];
      await db.query(
        'INSERT INTO faqs (question, answer, category, sub_category, order_index) VALUES (?, ?, ?, ?, ?)',
        [question, answer, category || 'General', sub_category || null, i]
      );
    }
    
    console.log('FAQs seeded successfully!');
    process.exit(0);
  } catch (error) {
    console.error('Error seeding FAQs:', error);
    process.exit(1);
  }
}

seed();
