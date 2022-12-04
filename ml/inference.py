from transformers import pipeline

import config


def main():
    classifier = pipeline(config.NLP_TASK, model=config.NLP_MODEL)
    sequence_to_classify = config.SEQUENCE_TO_CLASSIFY
    candidate_labels = config.CANDIDATE_LABELS
    outputs = classifier(sequence_to_classify, candidate_labels)
    print(outputs)


if __name__ == "__main__":
    main()
