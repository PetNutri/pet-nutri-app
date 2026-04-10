/// English translations for all PetCondition data, keyed by condition id.
class ConditionTranslation {
  final String name;
  final String description;
  final String treatment;
  final List<String> symptoms;
  final List<GuidelineTranslation> guidelines;

  const ConditionTranslation({
    required this.name,
    required this.description,
    required this.treatment,
    required this.symptoms,
    required this.guidelines,
  });
}

class GuidelineTranslation {
  final String nutrient;
  final String recommendation;
  final String reason;
  const GuidelineTranslation({required this.nutrient, required this.recommendation, required this.reason});
}

const Map<String, ConditionTranslation> conditionTranslationsEn = {
  // ==================== DOGS & CATS ====================
  'hepatitis': ConditionTranslation(
    name: 'Hepatitis',
    description: 'Hepatitis is inflammation of the liver that can be acute or chronic, caused by viral, bacterial, toxic, or autoimmune factors. Damage to hepatocytes leads to impaired metabolism, detoxification, and bile acid production. Without adequate treatment, it can progress to cirrhosis or complete liver failure.',
    treatment: 'Treatment depends on the cause and severity. For infectious canine hepatitis, antiviral protocols and supportive therapy are used, while bacterial infections are treated with antibiotics such as Amoxicillin or Metronidazole. Hepatoprotectors like S-adenosylmethionine (SAMe) and silymarin (milk thistle extract) help protect and regenerate liver cells. Ursodeoxycholic acid (Ursodiol) improves bile flow and reduces inflammation. IV fluid therapy corrects dehydration and electrolyte imbalances. Antiemetics like Maropitant (Cerenia) control vomiting, and vitamin K is given for coagulation disorders. Visit your veterinarian for blood tests (ALT, AST, bilirubin) and liver ultrasound.',
    symptoms: ['Loss of appetite', 'Vomiting', 'Jaundice (yellow skin and eyes)', 'Lethargy and weakness', 'Increased water intake', 'Dark urine', 'Bloated abdomen', 'Weight loss'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'moderate', reason: 'High-quality, easily digestible proteins in moderate amounts.'),
      GuidelineTranslation(nutrient: 'Fat', recommendation: 'low', reason: 'Reduced fat relieves the liver.'),
      GuidelineTranslation(nutrient: 'Copper', recommendation: 'avoid', reason: 'Copper accumulates in the damaged liver.'),
      GuidelineTranslation(nutrient: 'Fiber', recommendation: 'moderate', reason: 'Helps bind toxins in the intestines.'),
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'high', reason: 'Vitamins E and C protect liver cells.'),
    ],
  ),
  'kidney_disease': ConditionTranslation(
    name: 'Kidney Disease',
    description: 'Chronic kidney disease (CKD) is progressive and irreversible damage to kidney tissue leading to reduced ability to filter blood and eliminate waste. The disease is classified into four stages according to the IRIS system based on creatinine and SDMA levels. Early diagnosis and dietary intervention can significantly slow progression.',
    treatment: 'Treatment is lifelong and aimed at slowing progression. Phosphorus binders like aluminum hydroxide or lanthanum carbonate are added to food to reduce phosphorus absorption. Benazepril (ACE inhibitor) reduces proteinuria and protects kidney tissue. Subcutaneous fluids maintain hydration at home. Erythropoietin is given for severe anemia. Antiemetics and appetite stimulants like Mirtazapine help maintain food intake. Regular monitoring of blood parameters every 3-6 months is essential. Switching to a special renal diet with reduced protein and phosphorus is key.',
    symptoms: ['Increased urination', 'Increased thirst', 'Loss of appetite', 'Vomiting', 'Weight loss', 'Bad breath (ammonia smell)', 'Lethargy', 'Dehydration', 'Pale gums'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'low', reason: 'Reduced protein to avoid overloading the kidneys.'),
      GuidelineTranslation(nutrient: 'Phosphorus', recommendation: 'avoid', reason: 'Phosphorus worsens kidney function.'),
      GuidelineTranslation(nutrient: 'Sodium', recommendation: 'low', reason: 'Low sodium helps control blood pressure.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'high', reason: 'Reduces inflammation in the kidneys.'),
    ],
  ),
  'diabetes': ConditionTranslation(
    name: 'Diabetes',
    description: 'Diabetes mellitus is an endocrine disorder caused by insufficient insulin production (type 1, more common in dogs) or insulin resistance (type 2, more common in cats). Unregulated blood sugar damages blood vessels, nerves, kidneys, and eyes. Proper low-glycemic diet is the foundation of disease control along with insulin therapy.',
    treatment: 'The basis of treatment is insulin therapy — dogs most commonly use intermediate-acting insulin (Caninsulin/Vetsulin), while cats prefer long-acting insulin like Glargine (Lantus). Insulin dose is titrated based on blood glucose curves. Meals must be at the same time every day. In cats with type 2 diabetes, a low-carb high-protein diet can lead to remission. Regular fructosamine and blood glucose monitoring is essential. Visit your veterinarian immediately if you notice vomiting, lethargy, or acetone breath odor.',
    symptoms: ['Increased thirst', 'Frequent urination', 'Increased appetite with weight loss', 'Lethargy', 'Blurred vision', 'Slow wound healing', 'Frequent infections', 'Sweet breath odor'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Carbohydrates', recommendation: 'low', reason: 'Low GI prevents blood sugar spikes.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'High protein helps stabilize glucose.'),
      GuidelineTranslation(nutrient: 'Fiber', recommendation: 'high', reason: 'Fiber slows sugar absorption.'),
    ],
  ),
  'pancreatitis': ConditionTranslation(
    name: 'Pancreatitis',
    description: 'Pancreatitis is inflammation of the pancreas that occurs when digestive enzymes become active within the organ itself and begin to destroy tissue. It can be acute (sudden, severe) or chronic (recurring, milder). Fatty food, obesity, and certain medications are the most common triggers.',
    treatment: 'Acute pancreatitis requires hospitalization with aggressive IV fluid therapy. Analgesics like Buprenorphine or Methadone control severe abdominal pain. Antiemetics Maropitant (Cerenia) and Ondansetron control vomiting. Early enteral feeding with low-fat food is preferred once vomiting is controlled. For chronic pancreatitis, pancreatic enzyme supplementation may improve digestion. Visit your veterinarian for abdominal ultrasound and blood tests (lipase, amylase, cPLI/fPLI).',
    symptoms: ['Severe stomach pain', 'Vomiting', 'Diarrhea', 'Loss of appetite', 'Dehydration', 'Lethargy', 'Arched back (in dogs)', 'Elevated temperature'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Fat', recommendation: 'avoid', reason: 'Fat is the main trigger for pancreatitis.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'moderate', reason: 'Easily digestible proteins in moderate amounts.'),
      GuidelineTranslation(nutrient: 'Fiber', recommendation: 'moderate', reason: 'Aids digestion without overloading the pancreas.'),
    ],
  ),
  'allergies': ConditionTranslation(
    name: 'Food Allergies',
    description: 'Food allergy is an immune-mediated hypersensitivity reaction to certain proteins in food, most commonly beef, chicken, dairy, wheat, or soy. Diagnosis is made through an elimination diet lasting 8-12 weeks with a novel protein source the animal has not eaten before.',
    treatment: 'Treatment begins with a strict elimination diet with hydrolyzed proteins or a completely novel protein source for at least 8 weeks. Oclacitinib (Apoquel) is used for rapid itch reduction in dogs, while Lokivetmab (Cytopoint) is given as a monthly injection. Essential fatty acids (omega-3) help strengthen the skin barrier. After the elimination diet, a provocation test with individual foods identifies exact allergens. Visit a veterinary dermatologist for allergy testing.',
    symptoms: ['Skin itching', 'Redness and rash', 'Ear scratching', 'Paw licking', 'Diarrhea or soft stool', 'Vomiting', 'Hair loss', 'Chronic ear infections'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'moderate', reason: 'Use novel proteins (lamb, venison, fish).'),
      GuidelineTranslation(nutrient: 'Grains', recommendation: 'avoid', reason: 'Common allergens — avoid wheat, corn, soy.'),
    ],
  ),
  'obesity': ConditionTranslation(
    name: 'Obesity',
    description: 'Obesity is a condition of excessive body weight that occurs when energy intake chronically exceeds expenditure. An animal is considered obese when it exceeds 20% of ideal body weight. Obesity is a risk factor for diabetes, arthritis, heart disease, hepatic lipidosis, and shortened lifespan.',
    treatment: 'Treatment requires a combination of dietary regimen and increased physical activity under veterinary supervision. The goal is gradual weight loss of 1-2% per week. Switch to low-calorie dietary formulas with high protein and fiber content. L-carnitine supplementation helps burn fat and preserve muscle mass. Regular weight monitoring at the vet is essential.',
    symptoms: ['Visible excess weight', 'Difficulty breathing during exertion', 'Reduced activity', 'Difficulty moving', 'Cannot feel ribs', 'Quick fatigue', 'Limping (joint stress)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Calories', recommendation: 'low', reason: 'Reduced caloric intake for weight loss.'),
      GuidelineTranslation(nutrient: 'Fiber', recommendation: 'high', reason: 'Fiber provides a feeling of fullness.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'High protein preserves muscle mass during weight loss.'),
    ],
  ),
  'urinary': ConditionTranslation(
    name: 'Urinary Problems',
    description: 'Urinary problems include crystal and stone formation (urolithiasis) in the bladder or urethra, and feline idiopathic cystitis (FIC). The most common stone types are struvite and calcium oxalate. Urethral obstruction is an emergency that can lead to acute kidney failure and death within 24-48 hours.',
    treatment: 'Treatment depends on stone type and presence of obstruction. For urethral obstruction, emergency catheterization is needed. Struvite stones can be dissolved with special acidifying diets, while calcium oxalate stones require surgical removal (cystotomy). For feline idiopathic cystitis, stress reduction and glucosaminoglycan supplements help control symptoms. Visit your veterinarian for urinalysis and bladder imaging.',
    symptoms: ['Painful urination', 'Blood in urine', 'Frequent urination in small amounts', 'Urinating outside the litter box', 'Licking genital area', 'Straining to urinate', 'Inability to urinate (emergency!)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Magnesium', recommendation: 'low', reason: 'Excess magnesium contributes to crystal formation.'),
      GuidelineTranslation(nutrient: 'Phosphorus', recommendation: 'low', reason: 'Phosphorus control reduces stone risk.'),
      GuidelineTranslation(nutrient: 'Moisture', recommendation: 'high', reason: 'Wet food helps dilute urine.'),
    ],
  ),
  'heart_disease': ConditionTranslation(
    name: 'Heart Disease',
    description: 'Heart diseases in dogs and cats include degenerative mitral valve disease (MMVD), dilated cardiomyopathy (DCM), and hypertrophic cardiomyopathy (HCM). The disease leads to reduced pumping ability, fluid accumulation in the lungs or abdomen, and progressive heart failure.',
    treatment: 'Pimobendan (Vetmedin) is the first-choice drug for dogs with MMVD and DCM. Furosemide (Lasix) removes excess fluid. ACE inhibitors like Enalapril slow disease progression. For cats with HCM, Atenolol or Diltiazem slow heart rate, and Clopidogrel prevents thromboembolism. Taurine supplementation is mandatory for taurine-deficiency DCM. Regular echocardiography is essential.',
    symptoms: ['Cough (especially at night)', 'Difficulty breathing', 'Quick fatigue', 'Reduced activity', 'Loss of appetite', 'Bloated abdomen (fluid)', 'Bluish gums', 'Fainting'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Sodium', recommendation: 'low', reason: 'Low sodium reduces fluid retention.'),
      GuidelineTranslation(nutrient: 'Taurine', recommendation: 'high', reason: 'Taurine is crucial for heart muscle function.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'high', reason: 'Reduces inflammation and supports the heart.'),
    ],
  ),
  'arthritis': ConditionTranslation(
    name: 'Arthritis',
    description: 'Osteoarthritis is a degenerative joint disease caused by deterioration of joint cartilage, leading to pain, inflammation, and reduced mobility. It most commonly affects hips, knees, elbows, and spine, especially in older and obese animals.',
    treatment: 'NSAIDs like Meloxicam (Metacam) or Carprofen (Rimadyl) are the basis of pain therapy in dogs. For cats, Solensia (Frunevetmab, anti-NGF antibody) is a newer option. Glucosamine-chondroitin supplements help protect cartilage. Omega-3 fatty acids in high doses have proven anti-inflammatory effects. Physical therapy including hydrotherapy significantly improves mobility. Maintaining ideal body weight is crucial.',
    symptoms: ['Limping', 'Stiffness after rest', 'Difficulty getting up', 'Reduced activity', 'Painful joints on touch', 'Swollen joints', 'Licking painful areas', 'Refusing to jump or climb'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'high', reason: 'Strong anti-inflammatory effect on joints.'),
      GuidelineTranslation(nutrient: 'Glucosamine', recommendation: 'high', reason: 'Supports cartilage repair.'),
      GuidelineTranslation(nutrient: 'Calories', recommendation: 'low', reason: 'Maintaining ideal weight reduces joint stress.'),
    ],
  ),
  'ibd': ConditionTranslation(
    name: 'Inflammatory Bowel Disease (IBD)',
    description: 'IBD is a chronic condition characterized by infiltration of inflammatory cells into the intestinal wall, leading to impaired digestion and nutrient absorption. Treatment requires a combination of dietary therapy and immunosuppressive drugs.',
    treatment: 'Prednisolone is the first-choice immunosuppressive drug given in tapering doses. Budesonide is an alternative with fewer systemic side effects. Metronidazole has anti-inflammatory and antibacterial effects on the intestines. For severe cases, stronger immunosuppressives like Azathioprine (dogs) or Chlorambucil (cats) are used. A diet with hydrolyzed proteins is key. Probiotics help restore healthy gut microflora.',
    symptoms: ['Chronic diarrhea', 'Vomiting', 'Weight loss', 'Loss of appetite', 'Blood or mucus in stool', 'Bloating and gas', 'Stomach pain', 'Poor coat condition'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'moderate', reason: 'Hydrolyzed or novel proteins reduce intestinal reaction.'),
      GuidelineTranslation(nutrient: 'Fat', recommendation: 'low', reason: 'Low fat is easier to digest.'),
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'high', reason: 'Support healthy gut flora.'),
    ],
  ),
  'hypothyroidism': ConditionTranslation(
    name: 'Hypothyroidism',
    description: 'Hypothyroidism is an endocrine disorder caused by insufficient thyroid hormone production, most commonly due to autoimmune thyroiditis. Reduced thyroid hormones slow the metabolism of the entire body.',
    treatment: 'Treatment is lifelong with oral synthetic thyroid hormone — Levothyroxine. Starting dose is usually 0.02 mg/kg twice daily, then adjusted based on blood tests. Improvement in energy is usually noticed within 1-2 weeks, while full coat recovery may take 3-6 months.',
    symptoms: ['Weight gain without increased appetite', 'Lethargy and sleepiness', 'Hair loss', 'Dry and flaky skin', 'Cold sensitivity', 'Slow pulse', 'Dark skin pigmentation', 'Frequent skin infections'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Calories', recommendation: 'low', reason: 'Slow metabolism requires fewer calories.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'High protein supports metabolism.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'high', reason: 'Helps skin and coat health.'),
    ],
  ),
  'hyperthyroidism': ConditionTranslation(
    name: 'Hyperthyroidism',
    description: 'Hyperthyroidism is the most common endocrine disorder in cats over 8 years old, caused by a benign thyroid tumor producing excessive thyroid hormones. Accelerated metabolism leads to weight loss despite increased appetite.',
    treatment: 'Methimazole (Tapazol/Felimazole) blocks hormone production. Radioactive iodine therapy (I-131) is the gold standard for permanent cure. Surgical thyroidectomy is an option for cats that cannot tolerate medication. A limited-iodine diet can control mild cases. Regular T4 monitoring every 3-6 months is essential.',
    symptoms: ['Weight loss with increased appetite', 'Increased thirst and urination', 'Hyperactivity and restlessness', 'Vomiting', 'Diarrhea', 'Poor coat condition', 'Rapid pulse', 'Aggression or behavior changes'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Iodine', recommendation: 'avoid', reason: 'Limiting iodine reduces hormone production.'),
      GuidelineTranslation(nutrient: 'Calories', recommendation: 'high', reason: 'Need to compensate for weight loss.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'High protein to preserve muscle mass.'),
    ],
  ),
  'dental_disease': ConditionTranslation(
    name: 'Dental Disease',
    description: 'Periodontal disease is the most common disease in dogs and cats — affecting over 80% of animals older than 3 years. It starts with plaque and tartar buildup, progresses to gingivitis, then periodontitis with jawbone destruction and tooth loss.',
    treatment: 'Professional dental cleaning under general anesthesia is the foundation of treatment. Extraction of severely damaged teeth is necessary. Antibiotics like Clindamycin or Amoxicillin-clavulanate are given for infection control. Daily tooth brushing with pet-specific toothpaste is the most important preventive measure.',
    symptoms: ['Bad breath', 'Red and swollen gums', 'Bleeding gums', 'Difficulty chewing', 'Loss of appetite', 'Dropping food from mouth', 'Drooling', 'Loose or lost teeth'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Food texture', recommendation: 'high', reason: 'Dry food helps mechanical tooth cleaning.'),
      GuidelineTranslation(nutrient: 'Calcium', recommendation: 'moderate', reason: 'Supports bone and tooth health.'),
      GuidelineTranslation(nutrient: 'Vitamin C', recommendation: 'high', reason: 'Helps gum health and healing.'),
    ],
  ),
  'skin_issues': ConditionTranslation(
    name: 'Skin Problems',
    description: 'Dermatological problems include atopic dermatitis, bacterial pyoderma, fungal infections, demodicosis, and seborrhea. Skin appearance directly reflects overall health and nutrition quality.',
    treatment: 'Treatment depends on the cause. Bacterial pyoderma is treated with antibiotics like Cephalexin. Fungal infections are treated with Itraconazole. Atopic dermatitis is controlled with Oclacitinib (Apoquel) or Lokivetmab (Cytopoint). Omega-3 supplementation and zinc improve skin and coat quality. Visit a veterinary dermatologist for skin testing.',
    symptoms: ['Itching and scratching', 'Dry and flaky skin', 'Hair loss', 'Skin redness', 'Greasy or smelly skin', 'Frequent skin infections', 'Dandruff', 'Licking and chewing skin'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'high', reason: 'Essential fatty acids for healthy skin and coat.'),
      GuidelineTranslation(nutrient: 'Zinc', recommendation: 'high', reason: 'Zinc is key for skin repair.'),
      GuidelineTranslation(nutrient: 'Biotin', recommendation: 'high', reason: 'Supports healthy coat growth.'),
    ],
  ),
  'gastritis': ConditionTranslation(
    name: 'Gastritis',
    description: 'Gastritis is inflammation of the stomach lining that can be acute (caused by ingestion of inappropriate food, drugs, or toxins) or chronic (caused by Helicobacter infection, autoimmune processes, or prolonged NSAID use).',
    treatment: 'Acute gastritis is treated with a short fast of 12-24 hours, then gradual introduction of bland diet. Antiemetics Maropitant and Metoclopramide control vomiting. Proton pump inhibitors like Omeprazole reduce stomach acid. Sucralfate creates a protective layer over damaged mucosa. Visit your veterinarian if vomiting lasts more than 24 hours.',
    symptoms: ['Vomiting', 'Loss of appetite', 'Stomach pain', 'Lethargy', 'Dehydration', 'Eating grass (in dogs)', 'Belching', 'Black stool (bleeding)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Fat', recommendation: 'low', reason: 'Low fat is easier on the stomach.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'moderate', reason: 'Easily digestible proteins in smaller meals.'),
    ],
  ),
  'epilepsy': ConditionTranslation(
    name: 'Epilepsy',
    description: 'Epilepsy is a chronic neurological disorder characterized by recurrent seizures due to abnormal electrical activity in the brain. Idiopathic epilepsy is the most common form in dogs, usually appearing between 1 and 5 years of age.',
    treatment: 'Phenobarbital is the first-choice antiepileptic in dogs, given orally twice daily. Potassium bromide (KBr) is used as additional therapy. Levetiracetam (Keppra) is a newer option with fewer liver side effects. A diet enriched with MCT oils has been clinically proven to reduce seizure frequency. Visit your veterinarian urgently if a seizure lasts more than 5 minutes.',
    symptoms: ['Seizures (convulsions)', 'Loss of consciousness', 'Uncontrolled trembling', 'Drooling', 'Disorientation after seizure', 'Body stiffness', 'Uncontrolled urination', 'Restlessness before seizure'],
    guidelines: [
      GuidelineTranslation(nutrient: 'MCT oils', recommendation: 'high', reason: 'Medium-chain fatty acids can reduce seizure frequency.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'high', reason: 'Neuroprotective effect.'),
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'high', reason: 'Protect nerve cells from damage.'),
    ],
  ),
  'anemia': ConditionTranslation(
    name: 'Anemia',
    description: 'Anemia is a reduction in red blood cells or hemoglobin, leading to insufficient oxygen supply to tissues. It can be regenerative (due to bleeding or hemolysis) or non-regenerative (due to bone marrow disease or nutritional deficiency).',
    treatment: 'Treatment depends on cause and severity. Severe anemia requires emergency blood transfusion. Autoimmune hemolytic anemia is treated with immunosuppressive doses of Prednisolone. Iron supplementation and vitamin B12 are important for nutritional deficits. Erythropoietin is given for chronic kidney disease-related anemia. Visit your veterinarian urgently if gums are pale or white.',
    symptoms: ['Pale gums', 'Lethargy and weakness', 'Quick fatigue', 'Rapid pulse', 'Difficulty breathing', 'Loss of appetite', 'Weight loss', 'Cold extremities'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Iron', recommendation: 'high', reason: 'Iron is essential for red blood cell production.'),
      GuidelineTranslation(nutrient: 'Vitamin B12', recommendation: 'high', reason: 'B12 supports blood cell formation.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'High-quality proteins for recovery.'),
    ],
  ),
  'cushing': ConditionTranslation(
    name: "Cushing's Syndrome",
    description: "Hyperadrenocorticism (Cushing's syndrome) is an endocrine disorder caused by chronic cortisol excess, most commonly due to a pituitary tumor (85% of cases). Excess cortisol causes muscle breakdown, fat redistribution, and immune suppression.",
    treatment: 'Trilostane (Vetoryl) is the first-choice drug — it inhibits cortisol synthesis and is given once or twice daily with food. Mitotane (Lysodren) is an alternative. For adrenal tumors, surgical adrenalectomy may be curative. Regular ACTH stimulation tests are needed every 3-6 months.',
    symptoms: ['Increased thirst and urination', 'Increased appetite', 'Bloated abdomen', 'Symmetrical hair loss', 'Thin skin', 'Lethargy', 'Frequent skin infections', 'Muscle weakness'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Calories', recommendation: 'low', reason: 'Weight control is crucial.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'High protein to preserve muscle mass.'),
      GuidelineTranslation(nutrient: 'Fiber', recommendation: 'high', reason: 'Fiber helps with feeling of fullness.'),
    ],
  ),
  'constipation': ConditionTranslation(
    name: 'Constipation',
    description: 'Constipation is difficult or infrequent bowel movements with hard, dry feces. It can progress to obstipation or megacolon. Most common causes are dehydration, lack of fiber, insufficient physical activity, and pelvic pain.',
    treatment: 'Treatment starts with increasing fiber (pumpkin, psyllium) and water intake, and switching to wet food. Lactulose is the first-choice osmotic laxative. Cisapride stimulates colon motility. For severe cases, manual evacuation under anesthesia may be needed. For cats with megacolon, subtotal colectomy may be necessary.',
    symptoms: ['Infrequent bowel movements', 'Straining during defecation', 'Hard and dry stool', 'Loss of appetite', 'Stomach pain', 'Lethargy', 'Vomiting', 'Bloating'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Fiber', recommendation: 'high', reason: 'Fiber stimulates bowel function.'),
      GuidelineTranslation(nutrient: 'Moisture', recommendation: 'high', reason: 'Wet food helps hydrate stool.'),
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'high', reason: 'Support healthy gut flora.'),
    ],
  ),
  // ==================== EXTRA DOG CONDITIONS ====================
  'distemper': ConditionTranslation(
    name: 'Distemper',
    description: 'Distemper is a severe viral disease of dogs caused by Canine Distemper Virus (CDV) that attacks the respiratory, gastrointestinal, and nervous systems. The virus spreads through airborne droplets and contact with infected secretions. Mortality in unvaccinated puppies can reach 80%.',
    treatment: 'There is no specific antiviral drug — treatment is exclusively supportive. IV fluids correct dehydration. Broad-spectrum antibiotics prevent secondary bacterial infections. Antiemetics like Maropitant control vomiting. Diazepam or Phenobarbital control seizures. Vaccination (DHPPi) is the only reliable prevention.',
    symptoms: ['High fever', 'Purulent nasal and eye discharge', 'Cough and difficulty breathing', 'Vomiting and diarrhea', 'Thickened paw pads', 'Muscle twitches and tics', 'Seizures', 'Lethargy and loss of appetite'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'High-quality, easily digestible proteins (chicken, turkey)', reason: 'Immune system support and muscle mass recovery during convalescence.'),
      GuidelineTranslation(nutrient: 'Hydration', recommendation: 'Increased fluid intake, wet food or adding water to dry food', reason: 'Replacing fluids lost through vomiting and diarrhea.'),
      GuidelineTranslation(nutrient: 'Vitamins A, C, E', recommendation: 'Supplements or antioxidant-rich food', reason: 'Strengthening immune response and protecting cells from oxidative stress.'),
    ],
  ),
  'parvovirus': ConditionTranslation(
    name: 'Parvovirus',
    description: 'Parvovirus is an acute, highly contagious viral disease caused by Canine Parvovirus type 2 (CPV-2) that attacks rapidly dividing cells of the intestinal epithelium and bone marrow. Mortality can reach 90% without treatment.',
    treatment: 'Treatment is intensive supportive care. Aggressive IV fluid therapy is the foundation. Antiemetics Maropitant and Ondansetron control vomiting. Broad-spectrum antibiotics prevent sepsis. Plasma transfusion may improve outcomes. Buprenorphine is used for abdominal pain control.',
    symptoms: ['Profuse bloody diarrhea', 'Severe vomiting', 'High fever followed by hypothermia', 'Severe dehydration', 'Lethargy and depression', 'Loss of appetite (anorexia)', 'Abdominal pain', 'Rapid weight loss'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Hydration', recommendation: 'IV rehydration, then gradual oral water and electrolytes', reason: 'Critical fluid and electrolyte replacement lost through massive diarrhea and vomiting.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'Easily digestible proteins in small, frequent meals after vomiting stops', reason: 'Intestinal epithelium repair requires amino acids, especially glutamine.'),
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'Veterinary probiotics after the acute phase', reason: 'Restoring gut microflora destroyed by the virus and antibiotics.'),
    ],
  ),
  'lyme_disease': ConditionTranslation(
    name: 'Lyme Disease',
    description: 'Lyme disease (borreliosis) is a multisystemic bacterial infection caused by Borrelia burgdorferi transmitted by Ixodes ticks. It affects joints, kidneys, heart, and nervous system.',
    treatment: 'Doxycycline is the first-choice antibiotic at 10 mg/kg orally every 12 hours for 30 days. NSAIDs like Meloxicam control joint pain and inflammation. For Lyme nephritis, immunosuppressive therapy and ACE inhibitors are added. Prevention includes regular antiparasitic use and Lyme vaccination.',
    symptoms: ['Shifting leg lameness', 'Swollen and painful joints', 'Elevated temperature', 'Lethargy and malaise', 'Loss of appetite', 'Enlarged lymph nodes', 'Stiff gait', 'Touch sensitivity'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Omega-3 fatty acids', recommendation: 'Fish oil or flaxseed oil daily', reason: 'Reducing joint inflammation and supporting kidney function.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'Moderate, high-quality proteins; reduce if kidneys are affected', reason: 'Immune system support while protecting kidneys from overload.'),
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'Food rich in vitamin E, selenium, and curcumin', reason: 'Protecting tissues from oxidative damage caused by chronic inflammation.'),
    ],
  ),
  'heartworm': ConditionTranslation(
    name: 'Heartworm Disease (Dirofilariasis)',
    description: 'Dirofilariasis is a parasitic disease caused by Dirofilaria immitis nematodes living in pulmonary arteries and the right heart. Mosquitoes transmit larval stages between dogs. Untreated disease leads to pulmonary hypertension and congestive heart failure.',
    treatment: 'Adulticide therapy involves intramuscular Melarsomine dihydrochloride (Immiticide) in a three-injection protocol. Doxycycline is given for 4 weeks to eliminate Wolbachia endosymbiont. Monthly Ivermectin or Moxidectin prevents new infections. Strict rest for 6-8 weeks after treatment is mandatory.',
    symptoms: ['Chronic cough', 'Exercise intolerance', 'Shortness of breath after activity', 'Weight loss', 'Abdominal distension (ascites)', 'Lethargy', 'Collapse after exertion', 'Pale mucous membranes'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'Moderate high-quality proteins to maintain muscle mass', reason: 'Preventing cachexia without overloading the cardiopulmonary system.'),
      GuidelineTranslation(nutrient: 'Sodium', recommendation: 'Low sodium intake', reason: 'Reducing fluid retention and cardiac workload.'),
      GuidelineTranslation(nutrient: 'Taurine and L-carnitine', recommendation: 'Supplementation or food rich in these amino acids', reason: 'Supporting heart muscle function and myocardial energy metabolism.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'Fish oil as a source of EPA and DHA', reason: 'Reducing inflammation in pulmonary arteries and supporting cardiovascular health.'),
    ],
  ),
  'bloat': ConditionTranslation(
    name: 'Gastric Torsion (GDV)',
    description: 'Gastric dilatation-volvulus (GDV) is an acute, life-threatening condition where the stomach expands with gas and rotates on its axis. Most commonly affects large and giant breed dogs with deep chests. Without emergency surgery, death occurs within hours.',
    treatment: 'GDV is a surgical emergency requiring immediate stabilization and surgery. Initial stabilization includes aggressive IV fluid therapy. Gastropexy involves derotation and fixation of the stomach to the abdominal wall. Lidocaine infusion prevents ventricular arrhythmias. Antibiotics are given prophylactically.',
    symptoms: ['Non-productive retching', 'Sudden abdominal bloating', 'Restlessness and inability to find a comfortable position', 'Excessive drooling', 'Rapid heart rate (tachycardia)', 'Pale gums', 'Weakness and collapse', 'Pain on abdominal palpation'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Meal size', recommendation: 'Multiple smaller meals daily (3-4) instead of one large meal', reason: 'Reducing risk of excessive stomach distension.'),
      GuidelineTranslation(nutrient: 'Feeding speed', recommendation: 'Use slow-feeder bowl or puzzle feeder', reason: 'Preventing aerophagia (air swallowing) that contributes to dilation.'),
      GuidelineTranslation(nutrient: 'Food type', recommendation: 'Avoid food high in fat and fermentable carbohydrates', reason: 'Reducing gas production in the stomach.'),
    ],
  ),
  'addison': ConditionTranslation(
    name: "Addison's Disease",
    description: "Addison's disease (hypoadrenocorticism) is an endocrine disorder caused by insufficient cortisol and aldosterone production, most commonly due to autoimmune destruction of the adrenal cortex. It is called 'the great imitator' because symptoms mimic many other conditions.",
    treatment: "Acute Addisonian crisis is treated with aggressive IV normal saline for hyponatremia correction. Dexamethasone is given IV as emergency cortisol replacement. Hyperkalemia is treated with IV calcium gluconate and insulin with dextrose. Long-term therapy includes monthly DOCP (Percorten-V) injections and low-dose Prednisolone. Regular electrolyte monitoring is essential.",
    symptoms: ['Episodic lethargy and weakness', 'Vomiting and diarrhea', 'Loss of appetite', 'Weight loss', 'Trembling and muscle weakness', 'Dehydration', 'Bradycardia', 'Collapse (Addisonian crisis)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Sodium', recommendation: 'Moderate to increased sodium intake in food', reason: 'Compensating sodium loss due to aldosterone deficiency.'),
      GuidelineTranslation(nutrient: 'Potassium', recommendation: 'Avoid food high in potassium', reason: 'Preventing hyperkalemia that can cause cardiac arrhythmias.'),
      GuidelineTranslation(nutrient: 'Energy density', recommendation: 'Calorie-dense, easily digestible food', reason: 'Maintaining body weight and energy levels in dogs with reduced appetite.'),
    ],
  ),
  'luxating_patella': ConditionTranslation(
    name: 'Luxating Patella',
    description: 'Luxating patella is an orthopedic condition where the kneecap slips out of its normal position, most commonly medially. Most common in small breed dogs and classified into four severity grades.',
    treatment: 'For grades I-II, conservative therapy includes NSAIDs and joint supplements. For grades III-IV, surgical correction is needed — trochleoplasty, tibial tuberosity transposition, and lateral tightening. Post-operative rehabilitation includes hydrotherapy and controlled exercises.',
    symptoms: ['Occasional skipping steps on hind leg', 'Sudden lifting of hind leg while walking', 'Intermittent lameness', 'Difficulty jumping and climbing', 'Stiff gait after rest', 'Pain when bending knee', 'Joint crepitus', 'Muscle loss on affected leg'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Body weight', recommendation: 'Maintain ideal body weight with strict calorie control', reason: 'Reducing knee joint stress and slowing cartilage degeneration.'),
      GuidelineTranslation(nutrient: 'Glucosamine and chondroitin', recommendation: 'Daily supplementation with glucosamine (500 mg) and chondroitin (400 mg)', reason: 'Supporting joint cartilage repair and protection.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'Fish oil as a source of EPA and DHA fatty acids', reason: 'Natural anti-inflammatory effect to reduce joint pain and swelling.'),
    ],
  ),
  'hip_dysplasia': ConditionTranslation(
    name: 'Hip Dysplasia',
    description: 'Hip dysplasia is a hereditary developmental disorder where the femoral head does not fit properly into the acetabulum, leading to joint laxity, abnormal cartilage wear, and secondary osteoarthritis. Most common in large and giant breeds.',
    treatment: 'Conservative therapy includes NSAIDs for pain control. Glucosamine, chondroitin, and MSM supplements provide chondroprotective effects. For young dogs, juvenile pubic symphysiodesis (JPS) or triple pelvic osteotomy (TPO) are options. For adults with severe arthritis, total hip replacement (THR) or femoral head ostectomy (FHO) are definitive solutions.',
    symptoms: ['Difficulty rising from lying position', 'Hind leg lameness', 'Bunny hopping gait', 'Hind leg muscle loss', 'Exercise intolerance', 'Pain on hip manipulation', 'Hip joint crepitus', 'Avoiding jumping and climbing stairs'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Calcium and phosphorus', recommendation: 'Controlled Ca:P ratio (1.2:1) — do not add calcium to complete food', reason: 'Preventing excessive bone growth in large breed puppies.'),
      GuidelineTranslation(nutrient: 'Calories', recommendation: 'Controlled caloric intake, especially in large breed puppies', reason: 'Preventing rapid growth that worsens dysplasia.'),
      GuidelineTranslation(nutrient: 'Omega-3 and joint supplements', recommendation: 'Fish oil, glucosamine, chondroitin, and MSM', reason: 'Reducing inflammation and supporting joint cartilage health.'),
      GuidelineTranslation(nutrient: 'Body weight', recommendation: 'Maintain lean body condition (BCS 4-5/9)', reason: 'Every extra kilogram significantly increases stress on dysplastic hips.'),
    ],
  ),
  'ivdd': ConditionTranslation(
    name: 'Intervertebral Disc Disease (IVDD)',
    description: 'IVDD is a degenerative spinal condition where discs between vertebrae herniate and compress the spinal cord or nerve roots. Type I is most common in chondrodystrophic breeds (Dachshund, Beagle, French Bulldog). Severe herniations can lead to paralysis.',
    treatment: 'Conservative therapy for mild cases includes strict cage rest for 4-6 weeks. Prednisolone reduces spinal cord edema. Gabapentin is used for neuropathic pain. For severe cases, surgical decompression (hemilaminectomy) is needed. Post-operative physical therapy includes hydrotherapy and electrostimulation.',
    symptoms: ['Neck or back pain', 'Stiff gait and reluctance to move', 'Crying when lifted or touched', 'Hind leg weakness (paraparesis)', 'Ataxia (unsteady gait)', 'Loss of proprioception (knuckling)', 'Hind leg paralysis (paraplegia)', 'Urinary and fecal incontinence'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Body weight', recommendation: 'Strict maintenance of ideal body weight', reason: 'Reducing mechanical stress on the spine and discs.'),
      GuidelineTranslation(nutrient: 'Anti-inflammatory nutrients', recommendation: 'Omega-3 fatty acids, curcumin, and vitamin E', reason: 'Reducing inflammation around the compressed spinal cord.'),
      GuidelineTranslation(nutrient: 'Fiber', recommendation: 'Adequate fiber to prevent constipation', reason: 'Straining during defecation can worsen pain and disc pressure.'),
    ],
  ),
  'cherry_eye': ConditionTranslation(
    name: 'Cherry Eye (Third Eyelid Gland Prolapse)',
    description: 'Cherry eye is a condition where the tear gland of the third eyelid prolapses and becomes visible as a red, swollen mass in the inner corner of the eye. Most common in brachycephalic breeds. The gland produces 30-50% of total tear fluid.',
    treatment: 'Surgical repositioning is the only permanent treatment — the pocket technique is the method of choice. Gland removal is NOT recommended as it leads to dry eye. Topical antibiotics control secondary infection. Artificial tears are used if tear production decreases.',
    symptoms: ['Red swollen mass in inner eye corner', 'Tearing (epiphora)', 'Conjunctival redness', 'Rubbing eye with paw', 'Purulent eye discharge', 'Third eyelid swelling', 'Dry eye (in chronic cases)', 'Squinting of affected eye'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Omega-3 fatty acids', recommendation: 'Fish oil for eye health support and inflammation reduction', reason: 'EPA and DHA have anti-inflammatory effects and support the tear film.'),
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'Food rich in beta-carotene (carrots, sweet potato)', reason: 'Vitamin A is essential for conjunctival epithelium and tear gland health.'),
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'Blueberries, broccoli, and vitamin E', reason: 'Protecting eye tissues from oxidative stress.'),
    ],
  ),
  // ==================== EXTRA CAT CONDITIONS ====================
  'fip': ConditionTranslation(
    name: 'FIP (Feline Infectious Peritonitis)',
    description: 'Feline infectious peritonitis (FIP) is a fatal systemic disease caused by a mutated strain of feline coronavirus (FCoV). There are two forms: effusive (wet) with fluid accumulation, and non-effusive (dry) with granulomatous lesions in organs.',
    treatment: 'GS-441524 (nucleoside analog) has shown remarkable efficacy with cure rates over 80%, given subcutaneously for 84 days. Molnupiravir is an oral alternative. Prednisolone is used short-term for inflammation. Therapeutic abdominocentesis or thoracocentesis relieves breathing in effusive form.',
    symptoms: ['Abdominal distension (ascites)', 'Difficulty breathing (pleural effusion)', 'Persistent fever unresponsive to antibiotics', 'Weight loss', 'Lethargy and depression', 'Jaundice (icterus)', 'Enlarged lymph nodes', 'Neurological changes (ataxia, nystagmus)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'High-quality, easily digestible proteins in high concentration', reason: 'Preventing cachexia and supporting the immune system.'),
      GuidelineTranslation(nutrient: 'Calories', recommendation: 'Calorie-dense food, wet food with high meat content', reason: 'Maintaining body weight in cats with reduced appetite.'),
      GuidelineTranslation(nutrient: 'Omega-3 and antioxidants', recommendation: 'Fish oil and vitamin E', reason: 'Immune response modulation and reducing oxidative stress.'),
    ],
  ),
  'fiv': ConditionTranslation(
    name: 'FIV (Feline AIDS)',
    description: 'Feline immunodeficiency virus (FIV) is a lentivirus that attacks CD4+ T-lymphocytes and gradually destroys the immune system, similar to HIV in humans. Transmission occurs mainly through bite wounds during fights.',
    treatment: 'There is no cure — treatment focuses on controlling secondary infections and supporting the immune system. Interferon omega is used for immunomodulation. Bacterial infections are treated aggressively with broad-spectrum antibiotics. Chronic stomatitis is treated with Cyclosporine or full mouth extraction. Zidovudine (AZT) may reduce viremia.',
    symptoms: ['Recurring infections (respiratory, skin, urinary)', 'Chronic gingivitis and stomatitis', 'Weight loss', 'Chronic diarrhea', 'Enlarged lymph nodes', 'Fever of unknown origin', 'Anemia', 'Slow-healing skin infections'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'High-quality animal proteins to maintain muscle mass', reason: 'Immune system support and prevention of muscle atrophy.'),
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'Vitamin E, vitamin C, selenium, and zinc', reason: 'Strengthening remaining immune capacity and protecting cells from oxidative stress.'),
      GuidelineTranslation(nutrient: 'Food safety', recommendation: 'Only thermally processed food — never raw meat or eggs', reason: 'Preventing opportunistic infections from contaminated raw food.'),
    ],
  ),
  'felv': ConditionTranslation(
    name: 'FeLV (Feline Leukemia)',
    description: 'Feline leukemia virus (FeLV) is a gammaretrovirus that integrates into host DNA and can cause immunosuppression, anemia, lymphoma, and other neoplasias. About 30% of persistently infected cats develop fatal diseases within 2-3 years.',
    treatment: 'Interferon omega is used for immunostimulation. Anemia is treated with Erythropoietin and iron supplementation. Lymphoma is treated with CHOP chemotherapy protocol. Appetite stimulants Mirtazapine or Capromorelin maintain body weight. Vaccination of healthy cats is the most important prevention.',
    symptoms: ['Progressive weight loss', 'Pale mucous membranes (anemia)', 'Enlarged lymph nodes', 'Recurring infections', 'Fever and lethargy', 'Diarrhea and vomiting', 'Stomatitis and gingivitis', 'Palpable abdominal masses (lymphoma)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein and calories', recommendation: 'High-calorie food with high animal protein content', reason: 'Preventing cachexia and supporting the immune system.'),
      GuidelineTranslation(nutrient: 'Iron and vitamin B12', recommendation: 'Iron-rich food (liver, red meat) and B12 supplementation', reason: 'Supporting erythropoiesis in cats with FeLV-induced anemia.'),
      GuidelineTranslation(nutrient: 'Food safety', recommendation: 'Only high-quality thermally processed food', reason: 'Immunosuppressed cats are extremely susceptible to foodborne infections.'),
    ],
  ),
  'asthma_cat': ConditionTranslation(
    name: 'Feline Asthma',
    description: 'Feline asthma is a chronic inflammatory disease of the lower airways characterized by bronchoconstriction, mucosal edema, and excessive mucus production. Environmental allergens are the most common triggers. The disease affects 1-5% of cats.',
    treatment: 'Inhaled corticosteroids — Fluticasone propionate via AeroKat inhaler twice daily for long-term control. Inhaled Salbutamol (Albuterol) for acute attacks. Systemic Prednisolone for severe cases. Cyclosporine as an alternative. Theophylline for nighttime symptoms. Environmental allergen elimination is equally important.',
    symptoms: ['Cough (often mistaken for hairball)', 'Open-mouth breathing', 'Visible breathing effort', 'Wheezing', 'Lethargy after episodes', 'Cyanosis (bluish mucous membranes)', 'Rapid shallow breathing (tachypnea)', 'Extended neck and lowered elbows position'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Omega-3 fatty acids', recommendation: 'Daily fish oil as EPA and DHA source', reason: 'Reducing bronchial inflammation and modulating immune response.'),
      GuidelineTranslation(nutrient: 'Body weight', recommendation: 'Maintain ideal body weight', reason: 'Obesity worsens respiratory function and makes breathing harder.'),
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'Vitamin E and vitamin C', reason: 'Protecting lung tissue from oxidative damage caused by chronic inflammation.'),
    ],
  ),
  'stomatitis_cat': ConditionTranslation(
    name: 'Feline Chronic Stomatitis',
    description: 'Feline chronic gingivostomatitis (FCGS) is a severe, painful oral inflammation affecting gums, cheek mucosa, tongue, and the back of the throat. It is believed to be caused by an excessive immune response to dental plaque.',
    treatment: 'Full mouth extraction is the most effective treatment with 60-80% improvement rate. Buprenorphine or Gabapentin for pain control. Cyclosporine for cats not responding to extraction. Laser therapy for granulomatous tissue ablation. Appetite stimulants help maintain body weight during treatment.',
    symptoms: ['Intense oral pain (vocalization while eating)', 'Food refusal despite hunger', 'Excessive drooling (ptyalism)', 'Bloody oral discharge', 'Bad breath (halitosis)', 'Weight loss', 'Unkempt coat (stopped grooming)', 'Difficulty swallowing (dysphagia)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Food texture', recommendation: 'Exclusively soft, pureed, or liquid food', reason: 'Minimizing pain while eating and enabling adequate caloric intake.'),
      GuidelineTranslation(nutrient: 'Protein and calories', recommendation: 'High-calorie wet food with high protein content', reason: 'Preventing malnutrition in cats eating minimal amounts due to pain.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'Fish oil mixed into food', reason: 'Anti-inflammatory effect to reduce oral inflammation.'),
      GuidelineTranslation(nutrient: 'Vitamin B complex', recommendation: 'B vitamin supplementation', reason: 'Supporting oral mucosa health and preventing deficiency due to reduced intake.'),
    ],
  ),
  // ==================== SHARED DOG & CAT ====================
  'mange': ConditionTranslation(
    name: 'Mange (Demodicosis/Sarcoptic)',
    description: 'Mange is a parasitic skin disease caused by mites — Demodex (demodicosis) or Sarcoptes scabiei (sarcoptic mange). Sarcoptic mange is highly contagious and can be transmitted to humans (zoonosis).',
    treatment: 'Isoxazoline antiparasitics are first-choice — Fluralaner (Bravecto) or Sarolaner (Simparica) show over 95% efficacy. Selamectin (Revolution) for sarcoptic mange. Secondary bacterial pyoderma is treated with systemic antibiotics. Medicated shampoos with Benzoyl peroxide or Chlorhexidine for topical therapy.',
    symptoms: ['Intense itching (especially sarcoptic)', 'Hair loss (alopecia)', 'Skin redness and inflammation', 'Crusts and scaling', 'Skin thickening (lichenification)', 'Secondary bacterial infections', 'Skin darkening (hyperpigmentation)', 'Unpleasant skin odor'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Omega-3 and Omega-6', recommendation: 'Fish oil and evening primrose oil for skin barrier support', reason: 'Restoring the skin lipid layer and reducing inflammation.'),
      GuidelineTranslation(nutrient: 'Zinc', recommendation: 'Zinc-rich food or supplementation', reason: 'Zinc is essential for skin regeneration and immune function.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'High-quality proteins for skin tissue repair', reason: 'Keratin and collagen require adequate amino acids for synthesis.'),
    ],
  ),
  'ringworm': ConditionTranslation(
    name: 'Ringworm (Dermatophytosis)',
    description: 'Dermatophytosis is a fungal infection of skin, hair, and claws caused by dermatophytes, most commonly Microsporum canis. The disease is highly contagious and a significant zoonosis — easily transmitted to humans. Spores can survive in the environment for up to 18 months.',
    treatment: 'Systemic antifungal therapy is mandatory — Itraconazole is first-choice in a pulse protocol for 6-8 weeks. Terbinafin is an alternative. Topical therapy includes Enilconazole (Imaverol) or Lime Sulfur baths twice weekly. Environmental decontamination with sodium hypochlorite (1:10) is critical.',
    symptoms: ['Circular areas of hair loss', 'Scaling and crusts on skin', 'Brittle hair that breaks easily', 'Skin redness at lesion border', 'Mild to moderate itching', 'Nail changes (onychomycosis)', 'Miliary dermatitis in cats', 'Kerion (inflammatory, purulent lesion)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'High-quality proteins for hair growth and skin repair', reason: 'Hair keratin requires adequate amino acids, especially cysteine and methionine.'),
      GuidelineTranslation(nutrient: 'Biotin and zinc', recommendation: 'Biotin and zinc supplementation', reason: 'Essential for skin, hair, and nail health and accelerating recovery.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'Fish oil for skin barrier support', reason: 'Strengthening skin barrier and reducing inflammation in affected areas.'),
    ],
  ),
  'ear_infection': ConditionTranslation(
    name: 'Otitis (Ear Infection)',
    description: 'Otitis externa is inflammation of the external ear canal affecting up to 20% of dogs and 7% of cats. Most common causes are allergies, moisture, ear mites, and anatomical predisposition.',
    treatment: 'Treatment depends on cause — bacterial otitis is treated with topical antibiotic drops containing Gentamicin or Marbofloxacin combined with corticosteroid and antifungal. Ear mite otitis is treated with Selamectin or Fluralaner. Ear canal flushing with Tris-EDTA increases antibiotic efficacy. For chronic recurrent otitis, TECA-LBO surgery may be necessary.',
    symptoms: ['Ear scratching and rubbing', 'Head shaking', 'Unpleasant ear odor', 'Redness and swelling of ear canal', 'Dark or purulent ear discharge', 'Pain when touching ears', 'Head tilting to one side', 'Hearing loss (in severe cases)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Omega-3 fatty acids', recommendation: 'Daily fish oil', reason: 'Reducing allergic inflammation that is the most common underlying cause of otitis.'),
      GuidelineTranslation(nutrient: 'Elimination diet', recommendation: 'Trial diet with novel protein if food allergy is suspected', reason: 'Food allergy is a common cause of recurrent otitis.'),
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'Veterinary probiotics for immune system support', reason: 'Modulating immune response and reducing allergy susceptibility.'),
    ],
  ),
  'conjunctivitis': ConditionTranslation(
    name: 'Conjunctivitis (Eye Inflammation)',
    description: 'Conjunctivitis is inflammation of the conjunctiva. In cats, the most common causes are Chlamydophila felis and feline herpesvirus (FHV-1), while in dogs it is usually secondary to allergies or dry eye.',
    treatment: 'Bacterial conjunctivitis is treated with topical antibiotic drops — Tobramycin or Chloramphenicol. Chlamydial conjunctivitis in cats requires systemic Doxycycline for 28 days. Herpesvirus conjunctivitis is treated with topical Cidofovir or oral Famciclovir. L-lysine is used to inhibit herpesvirus replication. Artificial tears with Hyaluronic acid for lubrication.',
    symptoms: ['Conjunctival redness', 'Tearing (epiphora)', 'Purulent or mucopurulent discharge', 'Eyelid swelling (blepharospasm)', 'Squinting of affected eye', 'Rubbing eyes with paw or on objects', 'Photophobia (light sensitivity)', 'Sticky eyelids (especially in morning)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'Food rich in beta-carotene and vitamin A', reason: 'Vitamin A is essential for conjunctival epithelium and tear film health.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'Fish oil for tear film support and inflammation reduction', reason: 'EPA and DHA improve tear film quality and reduce ocular inflammation.'),
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'Lutein, zeaxanthin, vitamin C and E', reason: 'Protecting eye tissues from oxidative damage.'),
    ],
  ),
  'heatstroke': ConditionTranslation(
    name: 'Heatstroke',
    description: 'Heatstroke (hyperthermia) is a life-threatening condition where body temperature exceeds 41°C. Dogs are especially susceptible as they cool only by panting. Brachycephalic, obese, and older animals are at highest risk.',
    treatment: 'Immediate cooling with lukewarm (not cold) water and fan for evaporative cooling. Aggressive IV fluid therapy with cold crystalloids. Temperature monitored rectally every 5 minutes, cooling stopped at 39.5°C. Fresh frozen plasma for DIC. Mannitol or Furosemide for acute kidney failure prevention. Intensive monitoring for 48-72 hours.',
    symptoms: ['Excessive panting and salivation', 'Dark red or bluish gums', 'Rapid heart rate (tachycardia)', 'Vomiting and diarrhea (often bloody)', 'Disorientation and staggering', 'Collapse and inability to stand', 'Seizures', 'Loss of consciousness'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Hydration', recommendation: 'Constant access to fresh, cool water; add electrolytes on hot days', reason: 'Preventing dehydration that increases heatstroke risk.'),
      GuidelineTranslation(nutrient: 'Meals', recommendation: 'Smaller, more frequent meals during hot days; avoid feeding during hottest part of day', reason: 'Food digestion produces heat and additionally burdens thermoregulation.'),
      GuidelineTranslation(nutrient: 'Wet food', recommendation: 'Prefer wet food or add water to dry food during summer', reason: 'Additional fluid intake through food helps maintain hydration.'),
    ],
  ),
  // ==================== BIRDS ====================
  'newcastle': ConditionTranslation(
    name: 'Newcastle Disease',
    description: 'Newcastle disease is a highly contagious viral disease of birds caused by paramyxovirus serotype 1 (APMV-1) that attacks the respiratory, nervous, and digestive systems. Velogenic strains cause up to 100% mortality in unvaccinated flocks.',
    treatment: 'No specific antiviral therapy exists — treatment is exclusively supportive. Electrolytes and vitamins are added to drinking water. Antibiotics prevent secondary bacterial infections. Vaccination with live attenuated vaccines is the most important preventive measure. Report suspected cases to veterinary authorities.',
    symptoms: ['Sneezing and coughing', 'Difficulty breathing', 'Greenish diarrhea', 'Drop in egg production', 'Neck twisting', 'Wing and leg paralysis', 'Head swelling', 'Sudden death'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'High protein supports the immune system.'),
      GuidelineTranslation(nutrient: 'Vitamin E', recommendation: 'high', reason: 'Antioxidant that strengthens immunity.'),
      GuidelineTranslation(nutrient: 'Electrolytes', recommendation: 'high', reason: 'Fluid replacement due to diarrhea.'),
    ],
  ),
  'coccidiosis_poultry': ConditionTranslation(
    name: 'Coccidiosis',
    description: 'Coccidiosis is a parasitic intestinal disease caused by protozoa of the genus Eimeria that destroys intestinal mucosa leading to bleeding, malabsorption, and dehydration. Most commonly affects young birds aged 3-8 weeks.',
    treatment: 'Toltrazuril (Baycox) is the first-choice anticoccidial given in drinking water for 2 consecutive days. Amprolium is an alternative given for 5-7 days. Vitamin K controls intestinal bleeding. Prevention includes dry bedding maintenance and using feed with coccidiostats for young chicks.',
    symptoms: ['Bloody diarrhea', 'Loss of appetite', 'Weight loss', 'Ruffled feathers', 'Lethargy', 'Dehydration', 'Pale combs and wattles', 'Drop in egg production'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Helps intestinal mucosa recovery.'),
      GuidelineTranslation(nutrient: 'Vitamin K', recommendation: 'high', reason: 'Helps stop intestinal bleeding.'),
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'high', reason: 'Restore healthy gut flora.'),
    ],
  ),
  'avian_influenza': ConditionTranslation(
    name: 'Avian Influenza',
    description: 'Avian influenza virus (AIV) is a highly pathogenic virus causing systemic infection with up to 100% mortality in poultry. Subtypes H5N1 and H7N9 have zoonotic potential — they can be transmitted to humans.',
    treatment: 'No specific treatment exists — for highly pathogenic strains, culling of infected flocks is legally mandatory. For low pathogenic strains, supportive therapy includes electrolytes, vitamins, and probiotics. Strict biosecurity measures are essential. Report all suspected cases to veterinary authorities within 24 hours.',
    symptoms: ['Sudden death', 'Drop in egg production', 'Head and eye swelling', 'Bluish combs and wattles', 'Difficulty breathing', 'Watery diarrhea', 'Lethargy', 'Leg hemorrhages'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin C', recommendation: 'high', reason: 'Supports immune response.'),
      GuidelineTranslation(nutrient: 'Selenium', recommendation: 'high', reason: 'Antioxidant that protects cells.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Supports body recovery.'),
    ],
  ),
  'infectious_bronchitis': ConditionTranslation(
    name: 'Infectious Bronchitis',
    description: 'Infectious bronchitis (IB) is an acute, highly contagious viral disease of chickens caused by a coronavirus (IBV) that primarily attacks the respiratory tract but can also damage kidneys and reproductive system.',
    treatment: 'No specific antiviral therapy — treatment is supportive. Antibiotics control secondary bacterial infections. Vitamins A, C, and E support the immune system. Vaccination with live attenuated vaccines is the primary preventive measure.',
    symptoms: ['Coughing and sneezing', 'Respiratory rales', 'Nasal discharge', 'Tearing eyes', 'Drop in egg production', 'Deformed eggs (soft shell)', 'Reduced feed intake', 'Lethargy'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Protects respiratory tract mucosa.'),
      GuidelineTranslation(nutrient: 'Electrolytes', recommendation: 'high', reason: 'Prevents dehydration.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Supports tissue recovery.'),
    ],
  ),
  'marek': ConditionTranslation(
    name: "Marek's Disease",
    description: "Marek's disease is a viral neoplastic disease of chickens caused by a herpesvirus that causes lymphoid tumors in nerves, skin, muscles, and internal organs. Vaccination of day-old chicks is the only effective preventive measure.",
    treatment: 'There is no treatment — once infected, birds remain lifelong carriers. Vaccination of day-old chicks with HVT vaccine is the only effective prevention. Affected birds with tumors or paralysis are euthanized. Strict biosecurity is key.',
    symptoms: ['Leg and wing paralysis', 'Weight loss', 'Gray eye color (pupil change)', 'Skin tumors', 'Difficulty breathing', 'Diarrhea', 'Reduced egg production', 'Sudden death in young birds'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'high', reason: 'Support the immune system.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Help body recovery.'),
      GuidelineTranslation(nutrient: 'Vitamin E', recommendation: 'high', reason: 'Protects cells from damage.'),
    ],
  ),
  'egg_binding': ConditionTranslation(
    name: 'Egg Binding',
    description: 'Egg binding is an emergency condition where a female bird cannot lay a formed egg, most commonly due to calcium deficiency weakening oviduct contractions. The condition is life-threatening and can lead to peritonitis and death within 24-48 hours.',
    treatment: 'Place the bird in a warm, humid environment (30-32°C). Calcium gluconate is given orally or by injection. Oxytocin stimulates contractions. If conservative methods fail, the vet performs ovocentesis. Prevention includes adequate calcium and vitamin D3 in the diet.',
    symptoms: ['Straining without laying', 'Bloated abdomen', 'Lethargy', 'Loss of appetite', 'Difficulty walking', 'Sitting on the floor', 'Difficulty breathing', 'Tissue protruding from cloaca'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Calcium', recommendation: 'high', reason: 'Calcium is key for shell formation and contractions.'),
      GuidelineTranslation(nutrient: 'Vitamin D3', recommendation: 'high', reason: 'Helps calcium absorption.'),
      GuidelineTranslation(nutrient: 'Moisture', recommendation: 'high', reason: 'Hydration helps egg laying.'),
    ],
  ),
  'bumblefoot': ConditionTranslation(
    name: 'Bumblefoot (Pododermatitis)',
    description: 'Pododermatitis is a bacterial foot infection most commonly caused by Staphylococcus aureus entering through small wounds on the foot pads. Predisposing factors include obesity, hard surfaces, and vitamin A deficiency.',
    treatment: 'Early stage: improve surface (soft bedding), add vitamin A, apply antibiotic ointment. Advanced stage with abscess: surgical incision, drainage, and necrotic tissue removal. Systemic antibiotics for 2-4 weeks. Meloxicam for pain control. Prevention includes soft perch surfaces and weight control.',
    symptoms: ['Limping', 'Foot swelling', 'Black scab on foot pad', 'Heat at infection site', 'Refusal to walk', 'Sitting in place', 'Loss of appetite', 'Lethargy'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Supports skin health and healing.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Needed for tissue recovery.'),
      GuidelineTranslation(nutrient: 'Zinc', recommendation: 'high', reason: 'Helps wound healing.'),
    ],
  ),
  // ==================== PIGEONS ====================
  'paramyxovirus': ConditionTranslation(
    name: 'Paramyxovirus (PMV)',
    description: 'Pigeon paramyxovirus is a viral nervous system disease caused by paramyxovirus serotype 1 (PPMV-1). The virus attacks the central nervous system and kidneys, causing characteristic neurological symptoms like neck twisting (torticollis).',
    treatment: 'No specific antiviral therapy — treatment is exclusively supportive. Vitamin B complex supports the nervous system. Electrolytes and glucose prevent dehydration. Affected pigeons are hand-fed if they cannot eat on their own. Annual vaccination with inactivated oil vaccine is the only reliable prevention.',
    symptoms: ['Neck twisting', 'Circling in place', 'Loss of balance', 'Watery green diarrhea', 'Weight loss', 'Inability to fly', 'Head tremors', 'Paralysis'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Electrolytes', recommendation: 'high', reason: 'Prevents dehydration.'),
      GuidelineTranslation(nutrient: 'Vitamin B', recommendation: 'high', reason: 'Supports the nervous system.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Helps body recovery.'),
    ],
  ),
  'canker': ConditionTranslation(
    name: 'Canker (Trichomoniasis)',
    description: 'Trichomoniasis (canker) is a parasitic disease caused by Trichomonas gallinae that infects the upper digestive tract. The parasite causes characteristic yellowish caseous plaques in the throat that can completely block the esophagus.',
    treatment: 'Metronidazole (Flagyl) is the first-choice drug given orally for 5-7 days. Ronidazole is an alternative for resistant strains. Carnidazole (Spartrix) is also effective as a single dose. Disinfection of waterers and feeders is mandatory. Preventive treatment of the entire flock is recommended.',
    symptoms: ['Yellowish throat plaques', 'Difficulty swallowing', 'Loss of appetite', 'Weight loss', 'Foul breath', 'Ruffled feathers', 'Vomiting', 'Discharge from beak'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Protects throat and crop mucosa.'),
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'high', reason: 'Restore healthy flora.'),
      GuidelineTranslation(nutrient: 'Soft food', recommendation: 'high', reason: 'Easier to swallow during illness.'),
    ],
  ),
  'pigeon_salmonella': ConditionTranslation(
    name: 'Salmonellosis (Paratyphoid)',
    description: 'Pigeon salmonellosis is a bacterial infection caused by Salmonella typhimurium that attacks intestines, joints, nervous system, and reproductive organs. The disease has multiple clinical forms — intestinal, joint, nervous, and organ.',
    treatment: 'Enrofloxacin (Baytril) is the first-choice antibiotic given in drinking water for 10-14 days. Amoxicillin-clavulanate is an alternative. Probiotics are given after antibiotic therapy. Thorough disinfection of the loft is mandatory. Chronic carriers should be considered for removal.',
    symptoms: ['Greenish watery diarrhea', 'Swollen joints', 'Limping', 'Weight loss', 'Ruffled feathers', 'Infertility', 'Dead embryos in eggs', 'Lethargy'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'high', reason: 'Help restore gut flora.'),
      GuidelineTranslation(nutrient: 'Electrolytes', recommendation: 'high', reason: 'Fluid replacement.'),
      GuidelineTranslation(nutrient: 'Vitamin E', recommendation: 'high', reason: 'Supports immunity.'),
    ],
  ),
  'pigeon_worms': ConditionTranslation(
    name: 'Worms (Helminthiasis)',
    description: 'Helminthiasis is a parasitic intestinal infection caused by various worm species — roundworms (Ascaridia), hairworms (Capillaria), and tapeworms (cestodes). Parasites feed on intestinal contents or blood, causing malabsorption and anemia.',
    treatment: 'Levamisole is a broad-spectrum anthelmintic for roundworms. Fenbendazole (Panacur) is effective against roundworms and hairworms, given for 3-5 days. Praziquantel is the drug of choice for tapeworms. Deworming is repeated after 14 days. Prevention includes regular fecal exams every 3-6 months.',
    symptoms: ['Weight loss', 'Diarrhea', 'Ruffled feathers', 'Reduced appetite', 'Poor feather condition', 'Lethargy', 'Visible worms in droppings', 'Anemia (pale mucosa)'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Helps intestinal mucosa recovery.'),
      GuidelineTranslation(nutrient: 'Iron', recommendation: 'high', reason: 'Replacement due to anemia.'),
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'high', reason: 'Gut flora restoration after treatment.'),
    ],
  ),
  'ornithosis': ConditionTranslation(
    name: 'Ornithosis (Chlamydia)',
    description: 'Ornithosis (chlamydiosis) is a bacterial infection caused by Chlamydia psittaci that attacks the respiratory tract, eyes, and internal organs. The disease is a zoonosis — it can be transmitted to humans causing atypical pneumonia.',
    treatment: 'Doxycycline is the first-choice antibiotic given orally for 21-45 days minimum. Remove all calcium sources during treatment as calcium reduces Doxycycline absorption. Owners must wear protective masks due to zoonotic risk. Report cases as ornithosis is a notifiable disease.',
    symptoms: ['Nasal discharge', 'Tearing eyes', 'Difficulty breathing', 'Sneezing', 'Greenish diarrhea', 'Loss of appetite', 'Ruffled feathers', 'Lethargy'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Protects respiratory mucosa.'),
      GuidelineTranslation(nutrient: 'Vitamin C', recommendation: 'high', reason: 'Supports immune response.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Helps recovery.'),
    ],
  ),
  // ==================== PARROTS ====================
  'pbfd': ConditionTranslation(
    name: 'PBFD (Beak and Feather Disease)',
    description: 'PBFD is a viral disease caused by circovirus that attacks feather follicles, beak matrix, and the immune system of parrots. The virus causes progressive feather loss, beak deformities, and severe immunosuppression.',
    treatment: 'No specific antiviral therapy or vaccine exists — treatment is exclusively supportive. High-quality nutrition rich in vitamin A, proteins, and antioxidants is the foundation. Secondary infections are treated with appropriate antibiotics or antifungals. Infected birds must be strictly isolated.',
    symptoms: ['Feather loss', 'Deformed feathers', 'Deformed beak', 'Brittle beak', 'Skin lesions', 'Frequent infections', 'Weight loss', 'Lethargy'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Crucial for skin and feather health.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Supports feather growth.'),
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'high', reason: 'Support the weakened immune system.'),
    ],
  ),
  'psittacosis': ConditionTranslation(
    name: 'Psittacosis (Parrot Fever)',
    description: 'Psittacosis is a bacterial infection caused by Chlamydia psittaci that causes respiratory problems, hepatitis, and enteritis in parrots. This is a serious zoonosis — infected birds shed bacteria through droppings and nasal secretions.',
    treatment: 'Doxycycline is the first-choice antibiotic and must be given for minimum 45 days in parrots. Remove all calcium sources during treatment. Supportive therapy includes vitamins A and C, probiotics, and electrolytes. Owners must wear protective masks. Report cases as psittacosis is a notifiable zoonosis.',
    symptoms: ['Difficulty breathing', 'Nasal and eye discharge', 'Greenish diarrhea', 'Ruffled feathers', 'Lethargy', 'Loss of appetite', 'Trembling', 'Weight loss'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Protects respiratory mucosa.'),
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'high', reason: 'Support gut flora during antibiotic treatment.'),
      GuidelineTranslation(nutrient: 'Electrolytes', recommendation: 'high', reason: 'Prevents dehydration.'),
    ],
  ),
  'aspergillosis': ConditionTranslation(
    name: 'Aspergillosis',
    description: 'Aspergillosis is a fungal respiratory infection caused by Aspergillus fumigatus. The fungus forms granulomas in air sacs and lungs, gradually compromising breathing. Stress, immunosuppression, and vitamin A deficiency predispose to the disease.',
    treatment: 'Treatment is prolonged (6-12 weeks or longer). Itraconazole is the first-choice antifungal. Voriconazole for severe or resistant cases. Amphotericin B is given by nebulization directly into the respiratory tract. Surgical removal of large aspergillomas may be needed. Prevention includes clean, dry environment and vitamin A-rich diet.',
    symptoms: ['Difficulty breathing', 'Respiratory rales and whistling', 'Voice loss', 'Loss of appetite', 'Weight loss', 'Lethargy', 'Droppings color change', 'Ruffled feathers'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Protects respiratory mucosa from fungi.'),
      GuidelineTranslation(nutrient: 'Antioxidants', recommendation: 'high', reason: 'Support immune response.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Helps body recovery.'),
    ],
  ),
  'feather_plucking': ConditionTranslation(
    name: 'Feather Plucking',
    description: 'Feather plucking (feather destructive behavior) is a complex condition that can have medical causes (skin infections, parasites, allergies, liver disease, vitamin A or calcium deficiency) or behavioral causes (boredom, stress, anxiety, lack of social interaction).',
    treatment: 'First rule out medical causes — complete blood work, tests for PBFD, chlamydia, and aspergillosis. Switch from seed-based diet to quality pellet with fresh fruits and vegetables. For behavioral plucking, environmental enrichment (foraging toys, puzzle feeders) and increased social interaction are key. Haloperidol or Clomipramine as last resort for severe psychogenic cases.',
    symptoms: ['Self-plucking feathers', 'Bare areas on body', 'Skin chewing', 'Irritability', 'Screaming', 'Stereotypic behavior', 'Loss of appetite', 'Aggression'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'high', reason: 'Supports skin and feather health.'),
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Crucial for skin health.'),
      GuidelineTranslation(nutrient: 'Calcium', recommendation: 'moderate', reason: 'Calcium deficiency can cause plucking.'),
    ],
  ),
  'avian_gastric_yeast': ConditionTranslation(
    name: 'Megabacteriosis (AGY)',
    description: 'Megabacteriosis (Avian Gastric Yeast) is a fungal stomach infection caused by Macrorhabdus ornithogaster that colonizes the proventriculus walls, reducing stomach acid secretion and causing malabsorption.',
    treatment: 'Oral Amphotericin B is the first-choice drug given directly into the beak twice daily for 10-14 days. Sodium benzoate acidifies the stomach environment. Diluted apple cider vinegar is used as an adjunct. Diet adjustment — switch to pellet and fresh vegetables instead of seeds. Relapses are common.',
    symptoms: ['Weight loss', 'Vomiting', 'Undigested food in droppings', 'Ruffled feathers', 'Lethargy', 'Loss of appetite', 'Diarrhea', 'Regurgitation'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Probiotics', recommendation: 'high', reason: 'Help control stomach fungi.'),
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Protects stomach mucosa.'),
      GuidelineTranslation(nutrient: 'Easily digestible food', recommendation: 'high', reason: 'Reduces stomach burden.'),
    ],
  ),
  'vitamin_a_deficiency': ConditionTranslation(
    name: 'Vitamin A Deficiency',
    description: 'Hypovitaminosis A is one of the most common nutritional problems in parrots fed exclusively seed mixtures, as seeds contain very little vitamin A and beta-carotene. Deficiency leads to mucosal metaplasia predisposing to chronic respiratory infections.',
    treatment: 'Correct the diet — gradual transition from seed mixtures to quality formulated pellet with daily fresh vegetables rich in beta-carotene. For severe deficiency, the vet gives injectable vitamin A. Oral vitamin A drops as directed by the vet. Secondary respiratory infections are treated with antibiotics. Prevention is simple — varied diet with pellet as the base (60-70%) and fresh fruits and vegetables (30-40%).',
    symptoms: ['White spots in mouth', 'Swollen sinuses', 'Nasal discharge', 'Poor feather condition', 'Frequent infections', 'Difficulty breathing', 'Eye problems', 'Loss of appetite'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Direct deficiency replacement.'),
      GuidelineTranslation(nutrient: 'Beta-carotene', recommendation: 'high', reason: 'Natural source of vitamin A.'),
      GuidelineTranslation(nutrient: 'Varied diet', recommendation: 'high', reason: 'Transition from seeds only to pellet and vegetables.'),
    ],
  ),
  'fatty_liver': ConditionTranslation(
    name: 'Fatty Liver (Hepatic Lipidosis)',
    description: 'Hepatic lipidosis is a metabolic disorder caused by excessive fat accumulation in liver cells, most commonly from a high-calorie diet rich in fatty seeds (sunflower, peanuts) and insufficient physical activity.',
    treatment: 'Drastic diet change — complete removal of fatty seeds and transition to low-fat pellet with fresh vegetables. Lactulose reduces blood ammonia levels. Silymarin (milk thistle) and SAMe are hepatoprotectors. Vitamin E and selenium as antioxidants. Encourage physical activity. For severe cases, assisted feeding and IV fluids.',
    symptoms: ['Obesity', 'Lethargy', 'Difficulty breathing', 'Loss of appetite', 'Overgrown beak', 'Overgrown nails', 'Poor feather condition', 'Diarrhea'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Fat', recommendation: 'low', reason: 'Reduce fatty foods, especially seeds.'),
      GuidelineTranslation(nutrient: 'Fiber', recommendation: 'high', reason: 'Vegetables and fruit instead of seeds.'),
      GuidelineTranslation(nutrient: 'Vitamin E', recommendation: 'high', reason: 'Protects liver cells.'),
    ],
  ),
  // ==================== FISH ====================
  'ich': ConditionTranslation(
    name: 'Ich (White Spot Disease)',
    description: 'Ichthyophthirius multifiliis (Ich) is the most common parasitic disease of aquarium fish. The parasite burrows under the skin forming characteristic white spots the size of salt grains all over the body and fins.',
    treatment: 'Raise water temperature by 2-3°C (up to 30°C max) to speed up the parasite lifecycle. Salt (sodium chloride) at 1-3 g/L for mild cases. Malachite green with formalin is the classic treatment. Methylene blue as an alternative. Remove activated carbon from filter during treatment. Quarantine new fish for minimum 2 weeks for prevention.',
    symptoms: ['White spots on body and fins', 'Rubbing against objects (flashing)', 'Rapid breathing', 'Clamped fins', 'Loss of appetite', 'Lethargy', 'Surface floating', 'Color loss'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin C', recommendation: 'high', reason: 'Strengthens fish immune system.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Supports body recovery.'),
      GuidelineTranslation(nutrient: 'Garlic', recommendation: 'moderate', reason: 'Garlic has antiparasitic properties.'),
    ],
  ),
  'fin_rot': ConditionTranslation(
    name: 'Fin Rot',
    description: 'Fin rot is a bacterial infection caused by Aeromonas, Pseudomonas, or Flavobacterium that destroys fin tissue from edges toward the base. Usually secondary to poor water quality, stress, or overcrowding.',
    treatment: 'Start by improving water quality — 25-50% water change, filter cleaning, and parameter testing. Antibacterial medications like Kanamycin, Erythromycin, or Trimethoprim-sulfa are added to water or food. API Melafix for early stages. Salt at 1-2 g/L for mild cases. Prevention includes maintaining good water quality and avoiding overcrowding.',
    symptoms: ['Ragged or frayed fin edges', 'White or reddish fin edge coloring', 'Fin shortening', 'Redness at fin base', 'Lethargy', 'Loss of appetite', 'Floating in place', 'White cloudiness on fins'],
    guidelines: [
      GuidelineTranslation(nutrient: 'Vitamin C', recommendation: 'high', reason: 'Supports tissue healing.'),
      GuidelineTranslation(nutrient: 'Protein', recommendation: 'high', reason: 'Needed for fin regeneration.'),
      GuidelineTranslation(nutrient: 'Omega-3', recommendation: 'high', reason: 'Anti-inflammatory effect.'),
    ],
  ),
};
